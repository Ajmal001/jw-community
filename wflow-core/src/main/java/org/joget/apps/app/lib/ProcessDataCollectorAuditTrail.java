package org.joget.apps.app.lib;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.joget.apps.app.model.AppDefinition;
import org.joget.apps.app.model.AuditTrail;
import org.joget.apps.app.service.AppService;
import org.joget.apps.app.service.AppUtil;
import org.joget.commons.util.DynamicDataSourceManager;
import org.joget.commons.util.HostManager;
import org.joget.commons.util.LogUtil;
import org.joget.plugin.base.DefaultAuditTrailPlugin;
import org.joget.report.model.ReportApp;
import org.joget.report.model.ReportWorkflowActivity;
import org.joget.report.model.ReportWorkflowActivityInstance;
import org.joget.report.model.ReportWorkflowPackage;
import org.joget.report.model.ReportWorkflowProcess;
import org.joget.report.model.ReportWorkflowProcessInstance;
import org.joget.report.service.ReportManager;
import org.joget.workflow.model.WorkflowActivity;
import org.joget.workflow.model.WorkflowProcess;
import org.joget.workflow.model.service.WorkflowManager;
import org.springframework.core.task.TaskExecutor;
import org.springframework.transaction.annotation.Transactional;

public class ProcessDataCollectorAuditTrail extends DefaultAuditTrailPlugin {
    
    public String getName() {
        return "Process Data Collector";
    }

    public String getVersion() {
        return "3.0.0";
    }

    public String getDescription() {
        return "Save process data into app_report_* tables for reporting purposes";
    }

    public Object execute(Map properties) {
        Object result = null;
        try {
            final AuditTrail auditTrail = (AuditTrail) properties.get("auditTrail");

            if (validation(auditTrail)) {
                String method = auditTrail.getMethod();
                WorkflowManager workflowManager = (WorkflowManager) AppUtil.getApplicationContext().getBean("workflowManager");
                WorkflowProcess process = null;
                WorkflowProcess trackProcess = null;
                WorkflowActivity activity = null;
                WorkflowActivity trackActivity = null;

                if (method.startsWith("process")) {
                    process = workflowManager.getRunningProcessById(auditTrail.getMessage());
                    trackProcess = workflowManager.getRunningProcessInfo(auditTrail.getMessage());
                } else {
                    activity = workflowManager.getActivityById(auditTrail.getMessage());
                    trackActivity = workflowManager.getRunningActivityInfo(auditTrail.getMessage());
                    process = workflowManager.getRunningProcessById(activity.getProcessId());
                    trackProcess = workflowManager.getRunningProcessInfo(activity.getProcessId());
                }

                String profile = DynamicDataSourceManager.getCurrentProfile();
                TaskExecutor executor = (TaskExecutor) AppUtil.getApplicationContext().getBean("reportExecutor");
                executor.execute(new ReportTask(profile, activity, trackActivity, process, trackProcess, auditTrail.getAppId(), auditTrail.getAppVersion()));
            }
            return result;
        } catch (Exception e) {
            LogUtil.error(getClass().getName(), e, "Error executing report plugin");
            return null;
        }
    }

    public String getLabel() {
        return "Process Data Collector";
    }

    public String getClassName() {
        return getClass().getName();
    }

    public String getPropertyOptions() {
        return "";
    }

    public boolean validation(AuditTrail auditTrail) {
        return auditTrail.getMethod().equals("getDefaultAssignments")
                || auditTrail.getMethod().equals("processAbort")
                || auditTrail.getMethod().equals("processCompleted")
                || auditTrail.getMethod().equals("assignmentAbort")
                || auditTrail.getMethod().equals("assignmentAccept")
                || auditTrail.getMethod().equals("assignmentComplete")
                || auditTrail.getMethod().equals("assignmentForceComplete")
                || auditTrail.getMethod().equals("assignmentReassignUser")
                || auditTrail.getMethod().equals("executeTool")
                || auditTrail.getMethod().equals("executeToolCompleted");
    }
    
    protected class ReportTask implements Runnable {
        String profile;
        String appId;
        String appVersion;
        WorkflowProcess wfProcess;
        WorkflowProcess wfTrackProcess;
        WorkflowActivity wfActivity;
        WorkflowActivity wfTrackActivity;
        
        ReportTask(String profile, WorkflowActivity wfActivity, WorkflowActivity wfTrackActivity, WorkflowProcess wfProcess, WorkflowProcess wfTrackProcess, String appId, String appVersion) {
            this.profile = profile;
            this.wfActivity = wfActivity;
            this.wfTrackActivity = wfTrackActivity;
            this.wfProcess = wfProcess;
            this.wfTrackProcess = wfTrackProcess;
            this.appId = appId;
            this.appVersion = appVersion;
        }
        
        @Transactional
        public void run() {
            HostManager.setCurrentProfile(profile);
            if (wfActivity != null) {
                updateActivityData(wfActivity, wfTrackActivity, wfProcess, wfTrackProcess, appId, appVersion);
            } else {
                updateProcessData(wfProcess, wfTrackProcess, appId, appVersion);
            }
        }
        
        protected ReportWorkflowProcessInstance updateProcessData(WorkflowProcess wfProcess, WorkflowProcess wfTrackProcess, String appId, String appVersion) {
            String processInstanceId = wfProcess.getInstanceId();

            WorkflowManager workflowManager = (WorkflowManager) AppUtil.getApplicationContext().getBean("workflowManager");
            ReportManager reportManager = (ReportManager) AppUtil.getApplicationContext().getBean("reportManager");
            AppService appService = (AppService) AppUtil.getApplicationContext().getBean("appService");

            if (wfTrackProcess != null) {
                ReportWorkflowProcessInstance pInstance = reportManager.getReportWorkflowProcessInstance(processInstanceId);
                if (pInstance == null) {
                    pInstance = new ReportWorkflowProcessInstance();
                    pInstance.setInstanceId(processInstanceId);

                    //get app
                    AppDefinition appDef = appService.getAppDefinition(appId, appVersion);
                    ReportApp reportApp = reportManager.getReportApp(appId, appVersion, appDef.getName());

                    //get package
                    ReportWorkflowPackage reportPackage = reportManager.getReportWorkflowPackage(reportApp, wfProcess.getPackageId(), wfProcess.getVersion(), wfProcess.getName());

                    //get process
                    ReportWorkflowProcess reportProcess = reportManager.getReportWorkflowProcess(reportPackage, wfProcess.getIdWithoutVersion(), wfProcess.getName());
                    pInstance.setReportWorkflowProcess(reportProcess);
                }

                pInstance.setRequester(wfTrackProcess.getRequesterId());
                pInstance.setState(wfProcess.getState());
                pInstance.setDue(wfTrackProcess.getDue());
                pInstance.setStartedTime(wfTrackProcess.getStartedTime());
                pInstance.setFinishTime(wfTrackProcess.getFinishTime());
                pInstance.setDelay(wfTrackProcess.getDelayInSeconds());
                pInstance.setTimeConsumingFromStartedTime(wfTrackProcess.getTimeConsumingFromDateStartedInSeconds());
                pInstance.setReportWorkflowActivityInstanceList(null); //to fix session issue. mapping set to no update
                reportManager.saveReportWorkflowProcessInstance(pInstance);
                
                return reportManager.getReportWorkflowProcessInstance(processInstanceId);
            }
            return null;
        }

        protected ReportWorkflowActivityInstance updateActivityData(WorkflowActivity wfActivity, WorkflowActivity wfTrackActivity, WorkflowProcess wfProcess, WorkflowProcess wfTrackProcess, String appId, String appVersion) {
            String activityInstanceId = wfActivity.getId();

            WorkflowManager workflowManager = (WorkflowManager) AppUtil.getApplicationContext().getBean("workflowManager");
            ReportManager reportManager = (ReportManager) AppUtil.getApplicationContext().getBean("reportManager");

            if (wfActivity != null) {
                ReportWorkflowActivityInstance aInstance = reportManager.getReportWorkflowActivityInstance(activityInstanceId);
                List<String> userList = new ArrayList<String>();
                if (aInstance == null) {
                    aInstance = new ReportWorkflowActivityInstance();
                    aInstance.setInstanceId(activityInstanceId);

                    //set process Instance
                    String processInstanceId = wfActivity.getProcessId();

                    ReportWorkflowProcessInstance processInstance = reportManager.getReportWorkflowProcessInstance(processInstanceId);
                    if (processInstance == null) {
                        processInstance = updateProcessData(wfProcess, wfTrackProcess, appId, appVersion);
                    }
                    aInstance.setReportWorkflowProcessInstance(processInstance);

                    //set activity
                    ReportWorkflowActivity reportActivtiy = reportManager.getReportWorkflowActivity(processInstance.getReportWorkflowProcess(), wfActivity.getActivityDefId(), wfActivity.getName());
                    aInstance.setReportWorkflowActivity(reportActivtiy);

                    //get assignment users
                    try {
                        int maxAttempt = 6;
                        int numOfAttempt = 0;
                        while ((userList == null || userList.isEmpty()) && numOfAttempt < maxAttempt) {
                            LogUtil.debug(getClass().getName(), "Attempting to get resource ids....");
                            userList = workflowManager.getAssignmentResourceIds(wfActivity.getProcessDefId(), wfActivity.getProcessId(), activityInstanceId);
                            Thread.sleep(1000);
                            numOfAttempt++;
                        }

                        LogUtil.debug(getClass().getName(), "Resource ids=" + userList);
                    } catch (Exception e) {
                        LogUtil.error(getClass().getName(), e, "Error executing report plugin");
                    }
                } else {
                    userList = workflowManager.getAssignmentResourceIds(wfActivity.getProcessDefId(), wfActivity.getProcessId(), activityInstanceId);
                }

                String assignmentUsers = "";
                if (userList != null) {
                    for (String username : userList) {
                        assignmentUsers += username + ",";
                    }
                }
                if (assignmentUsers.endsWith(",")) {
                    assignmentUsers = assignmentUsers.substring(0, assignmentUsers.length() - 1);
                }
                aInstance.setAssignmentUsers(assignmentUsers);

                aInstance.setPerformer(wfTrackActivity.getPerformer());
                aInstance.setNameOfAcceptedUser(wfTrackActivity.getNameOfAcceptedUser());
                aInstance.setState(wfActivity.getState());
                aInstance.setStatus(wfTrackActivity.getStatus());
                aInstance.setDue(wfTrackActivity.getDue());
                aInstance.setCreatedTime(wfTrackActivity.getCreatedTime());
                aInstance.setStartedTime(wfTrackActivity.getStartedTime());
                aInstance.setFinishTime(wfTrackActivity.getFinishTime());
                aInstance.setDelay(wfTrackActivity.getDelayInSeconds());
                aInstance.setTimeConsumingFromCreatedTime(wfTrackActivity.getTimeConsumingFromDateCreatedInSeconds());
                aInstance.setTimeConsumingFromStartedTime(wfTrackActivity.getTimeConsumingFromDateStartedInSeconds());

                reportManager.saveReportWorkflowActivityInstance(aInstance);

                return null;
            }
            return null;
        }
    }
}
