-- MySQL dump 10.13  Distrib 5.6.28, for osx10.8 (x86_64)
--
-- Host: localhost    Database: jwdb
-- ------------------------------------------------------
-- Server version	5.6.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SHKActivities`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivities` (
  `Id` varchar(100) NOT NULL,
  `ActivitySetDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `Process` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) DEFAULT NULL,
  `PDefName` varchar(200) NOT NULL,
  `ProcessId` varchar(200) NOT NULL,
  `ResourceId` varchar(100) DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `BlockActivityId` varchar(100) DEFAULT NULL,
  `Performer` varchar(100) DEFAULT NULL,
  `IsPerformerAsynchronous` smallint(6) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) DEFAULT NULL,
  `Activated` bigint(20) NOT NULL,
  `ActivatedTZO` bigint(20) NOT NULL,
  `Accepted` bigint(20) DEFAULT NULL,
  `AcceptedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivities` (`Id`),
  KEY `SHKActivities_TheResource` (`TheResource`),
  KEY `SHKActivities_State` (`State`),
  KEY `I2_SHKActivities` (`Process`,`ActivitySetDefinitionId`,`ActivityDefinitionId`),
  KEY `I3_SHKActivities` (`Process`,`State`),
  CONSTRAINT `SHKActivities_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`),
  CONSTRAINT `SHKActivities_State` FOREIGN KEY (`State`) REFERENCES `SHKActivityStates` (`oid`),
  CONSTRAINT `SHKActivities_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivities`
--

LOCK TABLES `SHKActivities` WRITE;
/*!40000 ALTER TABLE `SHKActivities` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityData` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityData` (`CNT`),
  UNIQUE KEY `I2_SHKActivityData` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityData_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityData`
--

LOCK TABLES `SHKActivityData` WRITE;
/*!40000 ALTER TABLE `SHKActivityData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityDataBLOBs` (
  `ActivityDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataBLOBs` (`ActivityDataWOB`,`OrdNo`),
  CONSTRAINT `SHKActivityDataBLOBs_ActivityDataWOB` FOREIGN KEY (`ActivityDataWOB`) REFERENCES `SHKActivityDataWOB` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityDataBLOBs`
--

LOCK TABLES `SHKActivityDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKActivityDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityDataWOB` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKActivityDataWOB` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityDataWOB_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityDataWOB`
--

LOCK TABLES `SHKActivityDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKActivityDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityStateEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityStateEventAudits` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStateEventAudits` (`Name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityStateEventAudits`
--

LOCK TABLES `SHKActivityStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKActivityStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKActivityStates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityStates` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStates` (`Name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKActivityStates`
--

LOCK TABLES `SHKActivityStates` WRITE;
/*!40000 ALTER TABLE `SHKActivityStates` DISABLE KEYS */;
INSERT INTO `SHKActivityStates` VALUES ('open.running','open.running',1000001,0),('open.not_running.not_started','open.not_running.not_started',1000003,0),('open.not_running.suspended','open.not_running.suspended',1000005,0),('closed.completed','closed.completed',1000007,0),('closed.terminated','closed.terminated',1000009,0),('closed.aborted','closed.aborted',1000011,0);
/*!40000 ALTER TABLE `SHKActivityStates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKAndJoinTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAndJoinTable` (
  `Process` decimal(19,0) NOT NULL,
  `BlockActivity` decimal(19,0) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAndJoinTable` (`CNT`),
  KEY `SHKAndJoinTable_BlockActivity` (`BlockActivity`),
  KEY `I2_SHKAndJoinTable` (`Process`,`BlockActivity`,`ActivityDefinitionId`),
  KEY `I3_SHKAndJoinTable` (`Activity`),
  CONSTRAINT `SHKAndJoinTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_BlockActivity` FOREIGN KEY (`BlockActivity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKAndJoinTable`
--

LOCK TABLES `SHKAndJoinTable` WRITE;
/*!40000 ALTER TABLE `SHKAndJoinTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAndJoinTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKAssignmentEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAssignmentEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) NOT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) NOT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `OldResourceUsername` varchar(100) DEFAULT NULL,
  `OldResourceName` varchar(100) DEFAULT NULL,
  `NewResourceUsername` varchar(100) NOT NULL,
  `NewResourceName` varchar(100) DEFAULT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentEventAudits` (`CNT`),
  KEY `SHKAssignmentEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKAssignmentEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKAssignmentEventAudits`
--

LOCK TABLES `SHKAssignmentEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKAssignmentEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAssignmentEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKAssignmentsTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAssignmentsTable` (
  `Activity` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) NOT NULL,
  `ActivityProcessId` varchar(100) NOT NULL,
  `ActivityProcessDefName` varchar(200) NOT NULL,
  `ResourceId` varchar(100) NOT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `IsValid` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentsTable` (`CNT`),
  UNIQUE KEY `I2_SHKAssignmentsTable` (`Activity`,`TheResource`),
  KEY `I3_SHKAssignmentsTable` (`TheResource`,`IsValid`),
  KEY `I4_SHKAssignmentsTable` (`ActivityId`),
  KEY `I5_SHKAssignmentsTable` (`ResourceId`),
  KEY `FK_rnb6mhntls567xpifcfvygkuu` (`ActivityProcessId`),
  CONSTRAINT `FK_183e6adufsi558hl5p4dqkqsx` FOREIGN KEY (`ActivityId`) REFERENCES `SHKActivities` (`Id`),
  CONSTRAINT `FK_rnb6mhntls567xpifcfvygkuu` FOREIGN KEY (`ActivityProcessId`) REFERENCES `SHKProcesses` (`Id`),
  CONSTRAINT `SHKAssignmentsTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAssignmentsTable_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKAssignmentsTable`
--

LOCK TABLES `SHKAssignmentsTable` WRITE;
/*!40000 ALTER TABLE `SHKAssignmentsTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAssignmentsTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKCounters`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKCounters` (
  `name` varchar(100) NOT NULL,
  `the_number` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCounters` (`name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKCounters`
--

LOCK TABLES `SHKCounters` WRITE;
/*!40000 ALTER TABLE `SHKCounters` DISABLE KEYS */;
INSERT INTO `SHKCounters` VALUES ('_xpdldata_',2,1000204,0);
/*!40000 ALTER TABLE `SHKCounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKCreateProcessEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKCreateProcessEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `PActivityId` varchar(100) DEFAULT NULL,
  `PProcessId` varchar(100) DEFAULT NULL,
  `PProcessName` varchar(254) DEFAULT NULL,
  `PProcessFactoryName` varchar(200) DEFAULT NULL,
  `PProcessFactoryVersion` varchar(20) DEFAULT NULL,
  `PActivityDefinitionId` varchar(90) DEFAULT NULL,
  `PActivityDefinitionName` varchar(90) DEFAULT NULL,
  `PProcessDefinitionId` varchar(90) DEFAULT NULL,
  `PProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PPackageId` varchar(90) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCreateProcessEventAudits` (`CNT`),
  KEY `SHKCreateProcessEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKCreateProcessEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKCreateProcessEventAudits`
--

LOCK TABLES `SHKCreateProcessEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKCreateProcessEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKCreateProcessEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKDataEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKDataEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) DEFAULT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDataEventAudits` (`CNT`),
  KEY `SHKDataEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKDataEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKDataEventAudits`
--

LOCK TABLES `SHKDataEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKDataEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKDataEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKDeadlines`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKDeadlines` (
  `Process` decimal(19,0) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `TimeLimit` bigint(20) NOT NULL,
  `TimeLimitTZO` bigint(20) NOT NULL,
  `ExceptionName` varchar(100) NOT NULL,
  `IsSynchronous` smallint(6) NOT NULL,
  `IsExecuted` smallint(6) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDeadlines` (`CNT`),
  KEY `I2_SHKDeadlines` (`Process`,`TimeLimit`),
  KEY `I3_SHKDeadlines` (`Activity`,`TimeLimit`),
  CONSTRAINT `SHKDeadlines_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKDeadlines_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKDeadlines`
--

LOCK TABLES `SHKDeadlines` WRITE;
/*!40000 ALTER TABLE `SHKDeadlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKDeadlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKEventTypes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKEventTypes` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKEventTypes` (`KeyValue`),
  UNIQUE KEY `I2_SHKEventTypes` (`Name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKEventTypes`
--

LOCK TABLES `SHKEventTypes` WRITE;
/*!40000 ALTER TABLE `SHKEventTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKEventTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupGroupTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupGroupTable` (
  `sub_gid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupGroupTable` (`sub_gid`,`groupid`),
  KEY `I2_SHKGroupGroupTable` (`groupid`),
  CONSTRAINT `SHKGroupGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKGroupGroupTable_sub_gid` FOREIGN KEY (`sub_gid`) REFERENCES `SHKGroupTable` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupGroupTable`
--

LOCK TABLES `SHKGroupGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKGroupGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupGroupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupTable` (
  `groupid` varchar(100) NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupTable` (`groupid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupTable`
--

LOCK TABLES `SHKGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUser` (
  `USERNAME` varchar(100) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUser` (`USERNAME`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupUser`
--

LOCK TABLES `SHKGroupUser` WRITE;
/*!40000 ALTER TABLE `SHKGroupUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupUserPackLevelPart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupUserPackLevelPart`
--

LOCK TABLES `SHKGroupUserPackLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKGroupUserPackLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUserPackLevelPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKGroupUserProcLevelPart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUserProcLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserProcLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserProcLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserProcLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserProcLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKGroupUserProcLevelPart`
--

LOCK TABLES `SHKGroupUserProcLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKGroupUserProcLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUserProcLevelPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNewEventAuditData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNewEventAuditData`
--

LOCK TABLES `SHKNewEventAuditData` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNewEventAuditDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditDataBLOBs` (
  `NewEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataBLOBs` (`NewEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataBLOBs_NewEventAuditDataWOB` FOREIGN KEY (`NewEventAuditDataWOB`) REFERENCES `SHKNewEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNewEventAuditDataBLOBs`
--

LOCK TABLES `SHKNewEventAuditDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNewEventAuditDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNewEventAuditDataWOB`
--

LOCK TABLES `SHKNewEventAuditDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNextXPDLVersions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNextXPDLVersions` (
  `XPDLId` varchar(90) NOT NULL,
  `NextVersion` varchar(20) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNextXPDLVersions` (`XPDLId`,`NextVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNextXPDLVersions`
--

LOCK TABLES `SHKNextXPDLVersions` WRITE;
/*!40000 ALTER TABLE `SHKNextXPDLVersions` DISABLE KEYS */;
INSERT INTO `SHKNextXPDLVersions` VALUES ('crm_community','2',1000201,0);
/*!40000 ALTER TABLE `SHKNextXPDLVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKNormalUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNormalUser` (
  `USERNAME` varchar(100) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNormalUser` (`USERNAME`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKNormalUser`
--

LOCK TABLES `SHKNormalUser` WRITE;
/*!40000 ALTER TABLE `SHKNormalUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNormalUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKOldEventAuditData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKOldEventAuditData`
--

LOCK TABLES `SHKOldEventAuditData` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKOldEventAuditDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditDataBLOBs` (
  `OldEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataBLOBs` (`OldEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataBLOBs_OldEventAuditDataWOB` FOREIGN KEY (`OldEventAuditDataWOB`) REFERENCES `SHKOldEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKOldEventAuditDataBLOBs`
--

LOCK TABLES `SHKOldEventAuditDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKOldEventAuditDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKOldEventAuditDataWOB`
--

LOCK TABLES `SHKOldEventAuditDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelParticipant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelParticipant` (`PARTICIPANT_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelParticipant_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelParticipant_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelParticipant`
--

LOCK TABLES `SHKPackLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLApp` (`APPLICATION_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelXPDLApp_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelXPDLApp_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLApp`
--

LOCK TABLES `SHKPackLevelXPDLApp` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppDetUsr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppTAAppDetUsr`
--

LOCK TABLES `SHKPackLevelXPDLAppTAAppDetUsr` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetUsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetUsr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppDetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppTAAppDetail`
--

LOCK TABLES `SHKPackLevelXPDLAppTAAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppTAAppUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppTAAppUser`
--

LOCK TABLES `SHKPackLevelXPDLAppTAAppUser` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKPackLevelXPDLAppToolAgntApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKPackLevelXPDLAppToolAgntApp`
--

LOCK TABLES `SHKPackLevelXPDLAppToolAgntApp` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppToolAgntApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppToolAgntApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelParticipant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelParticipant` (`PARTICIPANT_ID`,`PROCESSOID`),
  KEY `SHKProcLevelParticipant_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelParticipant_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLParticipantProcess` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelParticipant`
--

LOCK TABLES `SHKProcLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLApp` (`APPLICATION_ID`,`PROCESSOID`),
  KEY `SHKProcLevelXPDLApp_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelXPDLApp_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLApplicationProcess` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLApp`
--

LOCK TABLES `SHKProcLevelXPDLApp` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppDetUsr`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppTAAppDetUsr`
--

LOCK TABLES `SHKProcLevelXPDLAppTAAppDetUsr` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetUsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetUsr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppDetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppTAAppDetail`
--

LOCK TABLES `SHKProcLevelXPDLAppTAAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppTAAppUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppTAAppUser`
--

LOCK TABLES `SHKProcLevelXPDLAppTAAppUser` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcLevelXPDLAppToolAgntApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcLevelXPDLAppToolAgntApp`
--

LOCK TABLES `SHKProcLevelXPDLAppToolAgntApp` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppToolAgntApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppToolAgntApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessData` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessData` (`CNT`),
  UNIQUE KEY `I2_SHKProcessData` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessData_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessData`
--

LOCK TABLES `SHKProcessData` WRITE;
/*!40000 ALTER TABLE `SHKProcessData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessDataBLOBs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDataBLOBs` (
  `ProcessDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataBLOBs` (`ProcessDataWOB`,`OrdNo`),
  CONSTRAINT `SHKProcessDataBLOBs_ProcessDataWOB` FOREIGN KEY (`ProcessDataWOB`) REFERENCES `SHKProcessDataWOB` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessDataBLOBs`
--

LOCK TABLES `SHKProcessDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKProcessDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessDataWOB`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDataWOB` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text,
  `VariableValueVCHAR` varchar(4000) DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKProcessDataWOB` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessDataWOB_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessDataWOB`
--

LOCK TABLES `SHKProcessDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKProcessDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessDataWOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessDefinitions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDefinitions` (
  `Name` varchar(200) NOT NULL,
  `PackageId` varchar(90) NOT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionCreated` bigint(20) NOT NULL,
  `ProcessDefinitionVersion` varchar(20) NOT NULL,
  `State` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDefinitions` (`Name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessDefinitions`
--

LOCK TABLES `SHKProcessDefinitions` WRITE;
/*!40000 ALTER TABLE `SHKProcessDefinitions` DISABLE KEYS */;
INSERT INTO `SHKProcessDefinitions` VALUES ('crm_community#1#process1','crm_community','process1',1510206763022,'1',0,1000205,0);
/*!40000 ALTER TABLE `SHKProcessDefinitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessRequesters`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessRequesters` (
  `Id` varchar(100) NOT NULL,
  `ActivityRequester` decimal(19,0) DEFAULT NULL,
  `ResourceRequester` decimal(19,0) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessRequesters` (`Id`),
  KEY `I2_SHKProcessRequesters` (`ActivityRequester`),
  KEY `I3_SHKProcessRequesters` (`ResourceRequester`),
  CONSTRAINT `SHKProcessRequesters_ActivityRequester` FOREIGN KEY (`ActivityRequester`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKProcessRequesters_ResourceRequester` FOREIGN KEY (`ResourceRequester`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessRequesters`
--

LOCK TABLES `SHKProcessRequesters` WRITE;
/*!40000 ALTER TABLE `SHKProcessRequesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessRequesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessStateEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessStateEventAudits` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStateEventAudits` (`Name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessStateEventAudits`
--

LOCK TABLES `SHKProcessStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKProcessStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcessStates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessStates` (
  `KeyValue` varchar(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStates` (`Name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcessStates`
--

LOCK TABLES `SHKProcessStates` WRITE;
/*!40000 ALTER TABLE `SHKProcessStates` DISABLE KEYS */;
INSERT INTO `SHKProcessStates` VALUES ('open.running','open.running',1000000,0),('open.not_running.not_started','open.not_running.not_started',1000002,0),('open.not_running.suspended','open.not_running.suspended',1000004,0),('closed.completed','closed.completed',1000006,0),('closed.terminated','closed.terminated',1000008,0),('closed.aborted','closed.aborted',1000010,0);
/*!40000 ALTER TABLE `SHKProcessStates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKProcesses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcesses` (
  `SyncVersion` bigint(20) NOT NULL,
  `Id` varchar(100) NOT NULL,
  `ProcessDefinition` decimal(19,0) NOT NULL,
  `PDefName` varchar(200) NOT NULL,
  `ActivityRequesterId` varchar(100) DEFAULT NULL,
  `ActivityRequesterProcessId` varchar(100) DEFAULT NULL,
  `ResourceRequesterId` varchar(100) NOT NULL,
  `ExternalRequesterClassName` varchar(254) DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) DEFAULT NULL,
  `Created` bigint(20) NOT NULL,
  `CreatedTZO` bigint(20) NOT NULL,
  `Started` bigint(20) DEFAULT NULL,
  `StartedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcesses` (`Id`),
  KEY `I2_SHKProcesses` (`ProcessDefinition`),
  KEY `I3_SHKProcesses` (`State`),
  KEY `I4_SHKProcesses` (`ActivityRequesterId`),
  KEY `I5_SHKProcesses` (`ResourceRequesterId`),
  CONSTRAINT `SHKProcesses_ProcessDefinition` FOREIGN KEY (`ProcessDefinition`) REFERENCES `SHKProcessDefinitions` (`oid`),
  CONSTRAINT `SHKProcesses_State` FOREIGN KEY (`State`) REFERENCES `SHKProcessStates` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKProcesses`
--

LOCK TABLES `SHKProcesses` WRITE;
/*!40000 ALTER TABLE `SHKProcesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKResourcesTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKResourcesTable` (
  `Username` varchar(100) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKResourcesTable` (`Username`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKResourcesTable`
--

LOCK TABLES `SHKResourcesTable` WRITE;
/*!40000 ALTER TABLE `SHKResourcesTable` DISABLE KEYS */;
INSERT INTO `SHKResourcesTable` VALUES ('roleAnonymous',NULL,1000200,0);
/*!40000 ALTER TABLE `SHKResourcesTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKStateEventAudits`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKStateEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) DEFAULT NULL,
  `ActivityName` varchar(254) DEFAULT NULL,
  `ProcessId` varchar(100) NOT NULL,
  `ProcessName` varchar(254) DEFAULT NULL,
  `ProcessFactoryName` varchar(200) NOT NULL,
  `ProcessFactoryVersion` varchar(20) NOT NULL,
  `ActivityDefinitionId` varchar(90) DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) NOT NULL,
  `ProcessDefinitionName` varchar(90) DEFAULT NULL,
  `PackageId` varchar(90) NOT NULL,
  `OldProcessState` decimal(19,0) DEFAULT NULL,
  `NewProcessState` decimal(19,0) DEFAULT NULL,
  `OldActivityState` decimal(19,0) DEFAULT NULL,
  `NewActivityState` decimal(19,0) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKStateEventAudits` (`CNT`),
  KEY `SHKStateEventAudits_TheType` (`TheType`),
  KEY `SHKStateEventAudits_OldProcessState` (`OldProcessState`),
  KEY `SHKStateEventAudits_NewProcessState` (`NewProcessState`),
  KEY `SHKStateEventAudits_OldActivityState` (`OldActivityState`),
  KEY `SHKStateEventAudits_NewActivityState` (`NewActivityState`),
  CONSTRAINT `SHKStateEventAudits_NewActivityState` FOREIGN KEY (`NewActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_NewProcessState` FOREIGN KEY (`NewProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldActivityState` FOREIGN KEY (`OldActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldProcessState` FOREIGN KEY (`OldProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKStateEventAudits`
--

LOCK TABLES `SHKStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentApp`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentApp` (
  `TOOL_AGENT_NAME` varchar(250) NOT NULL,
  `APP_NAME` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentApp` (`TOOL_AGENT_NAME`,`APP_NAME`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentApp`
--

LOCK TABLES `SHKToolAgentApp` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentAppDetail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppDetail` (
  `APP_MODE` decimal(10,0) NOT NULL,
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetail` (`APP_MODE`,`TOOLAGENT_APPOID`),
  KEY `SHKToolAgentAppDetail_TOOLAGENT_APPOID` (`TOOLAGENT_APPOID`),
  CONSTRAINT `SHKToolAgentAppDetail_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentAppDetail`
--

LOCK TABLES `SHKToolAgentAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentAppDetailUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppDetailUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetailUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppDetailUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppDetailUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKToolAgentAppDetailUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentAppDetailUser`
--

LOCK TABLES `SHKToolAgentAppDetailUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppDetailUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppDetailUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentAppUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKToolAgentAppUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentAppUser`
--

LOCK TABLES `SHKToolAgentAppUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKToolAgentUser`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentUser` (
  `USERNAME` varchar(100) NOT NULL,
  `PWD` varchar(100) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentUser` (`USERNAME`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKToolAgentUser`
--

LOCK TABLES `SHKToolAgentUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserGroupTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserGroupTable` (
  `userid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserGroupTable` (`userid`,`groupid`),
  KEY `SHKUserGroupTable_groupid` (`groupid`),
  CONSTRAINT `SHKUserGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKUserGroupTable_userid` FOREIGN KEY (`userid`) REFERENCES `SHKUserTable` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserGroupTable`
--

LOCK TABLES `SHKUserGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKUserGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserGroupTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserPackLevelPart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserPackLevelPart`
--

LOCK TABLES `SHKUserPackLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKUserPackLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserPackLevelPart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserProcLevelParticipant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserProcLevelParticipant` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserProcLevelParticipant` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserProcLevelParticipant_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserProcLevelParticipant_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserProcLevelParticipant_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserProcLevelParticipant`
--

LOCK TABLES `SHKUserProcLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKUserProcLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserProcLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKUserTable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserTable` (
  `userid` varchar(100) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `passwd` varchar(50) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserTable` (`userid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKUserTable`
--

LOCK TABLES `SHKUserTable` WRITE;
/*!40000 ALTER TABLE `SHKUserTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLApplicationPackage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLApplicationPackage` (
  `PACKAGE_ID` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLApplicationPackage`
--

LOCK TABLES `SHKXPDLApplicationPackage` WRITE;
/*!40000 ALTER TABLE `SHKXPDLApplicationPackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLApplicationPackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLApplicationProcess`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLApplicationProcess` (
  `PROCESS_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLApplicationProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLApplicationProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLApplicationProcess`
--

LOCK TABLES `SHKXPDLApplicationProcess` WRITE;
/*!40000 ALTER TABLE `SHKXPDLApplicationProcess` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLApplicationProcess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLData` (
  `XPDLContent` longblob,
  `XPDLClassContent` longblob,
  `XPDL` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLData` (`CNT`),
  UNIQUE KEY `I2_SHKXPDLData` (`XPDL`),
  CONSTRAINT `SHKXPDLData_XPDL` FOREIGN KEY (`XPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLData`
--

LOCK TABLES `SHKXPDLData` WRITE;
/*!40000 ALTER TABLE `SHKXPDLData` DISABLE KEYS */;
INSERT INTO `SHKXPDLData` VALUES ('<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Package xmlns=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xpdl=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" Id=\"crm_community\" Name=\"CRM Community\" xsi:schemaLocation=\"http://www.wfmc.org/2002/XPDL1.0 http://wfmc.org/standards/docs/TC-1025_schema_10_xpdl.xsd\">\n    <PackageHeader>\n        <XPDLVersion>1.0</XPDLVersion>\n        <Vendor/>\n        <Created/>\n    </PackageHeader>\n    <Script Type=\"text/javascript\"/>\n    <Participants>\n        <Participant Id=\"requester\" Name=\"Requester\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"approver\" Name=\"Approver\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n    </Participants>\n    <Applications>\n        <Application Id=\"default_application\"/>\n    </Applications>\n    <WorkflowProcesses>\n        <WorkflowProcess Id=\"process1\" Name=\"Proposal Approval Process\">\n            <ProcessHeader DurationUnit=\"h\"/>\n            <DataFields>\n                <DataField Id=\"status\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n            </DataFields>\n            <Activities>\n                <Activity Id=\"approve_proposal\" Name=\"Approve Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Join Type=\"XOR\"/>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"189,51.79999084472655\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"approval\" Name=\"Approval\">\n                    <Route/>\n                    <Performer>approver</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition3\"/>\n                                    <TransitionRef Id=\"transition6\"/>\n                                    <TransitionRef Id=\"transition5\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"430,62.79999084472655\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"activity1\" Name=\"Resubmit Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"397,20.787493896484378\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"send_proposal\" Name=\"Send Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"669.0000534057617,92.78333282470703\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"parallel\" Name=\"Parallel\">\n                    <Route/>\n                    <Performer>approver</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"AND\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition7\"/>\n                                    <TransitionRef Id=\"transition8\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"588,61.599993896484364\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool1\" Name=\"Send Approval Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"735,63.974993896484364\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool2\" Name=\"Send Reject Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"394,168.39999694824218\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route1\" Name=\"Route 1\">\n                    <Route/>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"222,15\"/>\n                    </ExtendedAttributes>\n                </Activity>\n            </Activities>\n            <Transitions>\n                <Transition From=\"approve_proposal\" Id=\"transition2\" To=\"approval\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition3\" To=\"activity1\">\n                    <Condition Type=\"CONDITION\">status===\'resubmit\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"activity1\" Id=\"transition4\" To=\"approve_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition6\" Name=\"approved\" To=\"parallel\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"parallel\" Id=\"transition7\" To=\"send_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"parallel\" Id=\"transition8\" To=\"tool1\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition5\" To=\"tool2\">\n                    <Condition Type=\"CONDITION\">status===\'rejected\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition1\" To=\"approve_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n            </Transitions>\n            <ExtendedAttributes>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDER\" Value=\"requester;approver\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_START_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=route1,X_OFFSET=87,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=901,Y_OFFSET=74,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=send_proposal,X_OFFSET=809,Y_OFFSET=104,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=579,Y_OFFSET=180,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n            </ExtendedAttributes>\n        </WorkflowProcess>\n    </WorkflowProcesses>\n    <ExtendedAttributes>\n        <ExtendedAttribute Name=\"EDITING_TOOL\" Value=\"Web Workflow Designer\"/>\n        <ExtendedAttribute Name=\"EDITING_TOOL_VERSION\" Value=\"5.0-pre-alpha\"/>\n    </ExtendedAttributes>\n</Package>\n','��\0sr\0\'org.enhydra.shark.xpdl.elements.Package~+Vmŀ~�\0Z\0isTransientL\0extPkgRefsToIdst\0.Lorg/enhydra/shark/utilities/SequencedHashMap;L\0internalVersiont\0Ljava/lang/String;L\0\nnamespacest\0,Lorg/enhydra/shark/xpdl/elements/Namespaces;xr\0(org.enhydra.shark.xpdl.XMLComplexElement>����(��\0\0xr\05org.enhydra.shark.xpdl.XMLBaseForCollectionAndComplex������2\0L\0\nelementMapq\0~\0L\0elementst\0Ljava/util/ArrayList;xr\0!org.enhydra.shark.xpdl.XMLElement#+B�#���\0Z\0\nisReadOnlyZ\0\nisRequiredL\0nameq\0~\0L\0originalElementHashCodet\0Ljava/lang/Integer;L\0parentt\0#Lorg/enhydra/shark/xpdl/XMLElement;L\0valueq\0~\0xpt\0Packagesr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp)dpt\0\0sr\0,org.enhydra.shark.utilities.SequencedHashMap.�\"��\"&\0\0xpw\0\0\0\rt\0Idsr\0#org.enhydra.shark.xpdl.XMLAttribute#c݀��M;\0L\0choicesq\0~\0xq\0~\0q\0~\0sq\0~\0B1�q\0~\0\nt\0\rcrm_communitypt\0Namesq\0~\0\0q\0~\0sq\0~\0�q\0~\0\nt\0\rCRM Communitypt\0\rPackageHeadersr\0-org.enhydra.shark.xpdl.elements.PackageHeaderv�,��\0\0xq\0~\0\0q\0~\0sq\0~\0}��q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0XPDLVersionsr\0+org.enhydra.shark.xpdl.elements.XPDLVersion�\"}�Y.�w\0\0xr\0\'org.enhydra.shark.xpdl.XMLSimpleElement�m����\0\0xq\0~\0q\0~\0!sq\0~\0p1\')q\0~\0t\01.0t\0Vendorsr\0&org.enhydra.shark.xpdl.elements.Vendor t��E�:\0\0xq\0~\0#q\0~\0\'sq\0~\0l$fmq\0~\0t\0\0t\0Createdsr\0\'org.enhydra.shark.xpdl.elements.Createdz��dK�|[\0\0xq\0~\0#q\0~\0,sq\0~\0`p�Rq\0~\0t\0\0t\0Descriptionsr\0+org.enhydra.shark.xpdl.elements.Description۰73�8�\0\0xq\0~\0#\0q\0~\01sq\0~\0\Zwyq\0~\0t\0\0t\0\rDocumentationsr\0-org.enhydra.shark.xpdl.elements.Documentation`�9��y�\0\0xq\0~\0#\0q\0~\06sq\0~\0)�q\0~\0t\0\0t\0PriorityUnitsr\0,org.enhydra.shark.xpdl.elements.PriorityUnit�������\0\0xq\0~\0#\0q\0~\0;sq\0~\0B�`uq\0~\0t\0\0t\0CostUnitsr\0(org.enhydra.shark.xpdl.elements.CostUnit܎�=H�\0\0xq\0~\0#\0q\0~\0@sq\0~\0S�Qdq\0~\0t\0\0xsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0q\0~\0$q\0~\0)q\0~\0.q\0~\03q\0~\08q\0~\0=q\0~\0Bxt\0RedefinableHeadersr\01org.enhydra.shark.xpdl.elements.RedefinableHeader��M�Ϫ\'H\0\0xq\0~\0\0q\0~\0Gsq\0~\0i[|q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0PublicationStatussq\0~\0\0q\0~\0Msq\0~\0 ՗q\0~\0It\0\0sq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0UNDER_REVISIONt\0RELEASEDt\0\nUNDER_TESTxt\0Authorsr\0&org.enhydra.shark.xpdl.elements.Author5��fᧆ\0\0xq\0~\0#\0q\0~\0Usq\0~\0N��q\0~\0It\0\0t\0Versionsr\0\'org.enhydra.shark.xpdl.elements.Version9=3�~�JQ\0\0xq\0~\0#\0q\0~\0Zsq\0~\0s~cIq\0~\0It\0\0t\0Codepagesr\0(org.enhydra.shark.xpdl.elements.Codepage9$m�e�\rG\0\0xq\0~\0#\0q\0~\0_sq\0~\0%���q\0~\0It\0\0t\0\nCountrykeysr\0*org.enhydra.shark.xpdl.elements.Countrykey��.����\0\0xq\0~\0#\0q\0~\0dsq\0~\0#��vq\0~\0It\0\0t\0Responsiblessr\0,org.enhydra.shark.xpdl.elements.Responsibles$��{S�\0\0xr\0$org.enhydra.shark.xpdl.XMLCollection�jċm�\0\0xq\0~\0\0q\0~\0isq\0~\0<�hIq\0~\0It\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~\0Nq\0~\0Wq\0~\0\\q\0~\0aq\0~\0fq\0~\0lxt\0ConformanceClasssr\00org.enhydra.shark.xpdl.elements.ConformanceClass��y0|k��\0\0xq\0~\0\0q\0~\0rsq\0~\0o���q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0GraphConformancesq\0~\0\0q\0~\0xsq\0~\0B���q\0~\0tq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0FULL_BLOCKEDt\0LOOP_BLOCKEDt\0NON_BLOCKEDxxsq\0~\0E\0\0\0w\0\0\0q\0~\0yxt\0Scriptsr\0&org.enhydra.shark.xpdl.elements.ScriptQ�j�S�8\0\0xq\0~\0\0q\0~\0�sq\0~\0#G��q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0Typesq\0~\0q\0~\0�sq\0~\0*��q\0~\0�t\0text/javascriptpt\0Versionsq\0~\0\0q\0~\0�sq\0~\06T/Xq\0~\0�t\0\0pt\0Grammarsq\0~\0\0q\0~\0�sq\0~\0;\Z,q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�xt\0ExternalPackagessr\00org.enhydra.shark.xpdl.elements.ExternalPackagesw�\"+Ũ��\0\0xq\0~\0k\0q\0~\0�sq\0~\0��q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0TypeDeclarationssr\00org.enhydra.shark.xpdl.elements.TypeDeclarations\r��Ox5�\0\0xq\0~\0k\0q\0~\0�sq\0~\0B~��q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Participantssr\0,org.enhydra.shark.xpdl.elements.Participantsh`��g8J\0\0xq\0~\0k\0q\0~\0�sq\0~\0k�(cq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0+org.enhydra.shark.xpdl.elements.Participanto$��rc��\0\0xr\0+org.enhydra.shark.xpdl.XMLCollectionElementC�x�v�r\0\0xq\0~\0t\0Participantsq\0~\0P�H�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0a�q\0~\0�t\0	requesterpq\0~\0sq\0~\0\0q\0~\0sq\0~\09�^�q\0~\0�t\0	Requesterpt\0ParticipantTypesr\0/org.enhydra.shark.xpdl.elements.ParticipantType>�n�݅��\0\0xq\0~\0q\0~\0�sq\0~\0��	q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0DZS�q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0t\0RESOURCE_SETt\0RESOURCEt\0ROLEt\0ORGANIZATIONAL_UNITt\0HUMANt\0SYSTEMxxsq\0~\0E\0\0\0w\0\0\0q\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0fQ��q\0~\0�t\0\0t\0ExternalReferencesr\01org.enhydra.shark.xpdl.elements.ExternalReference�b��Q�\0\0xq\0~\0\0q\0~\0�sq\0~\0MDyq\0~\0�t\0\0sq\0~\0w\0\0\0t\0xrefsq\0~\0\0q\0~\0�sq\0~\07E7q\0~\0�t\0\0pt\0locationsq\0~\0q\0~\0�sq\0~\0!ڬ q\0~\0�t\0\0pt\0	namespacesq\0~\0\0q\0~\0�sq\0~\0K7eq\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�xt\0ExtendedAttributessr\02org.enhydra.shark.xpdl.elements.ExtendedAttributes�O���UF\0L\0extAttribsStringq\0~\0xq\0~\0k\0q\0~\0�sq\0~\0t�ݘq\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xsq\0~\0�t\0Participantsq\0~\0u�dq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0[r��q\0~\0�t\0approverpq\0~\0sq\0~\0\0q\0~\0sq\0~\0A$�q\0~\0�t\0Approverpt\0ParticipantTypesq\0~\0�q\0~\0�sq\0~\0_Bp�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0V���q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0q\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0S<Oq\0~\0�t\0\0t\0ExternalReferencesq\0~\0�\0q\0~\0�sq\0~\0_�t�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0ޛ�q\0~\0�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0c$\0bq\0~\0�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0P��%q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~q\0~	xt\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\0<hq\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~xxt\0Applicationssr\0,org.enhydra.shark.xpdl.elements.Applications����\0\0xq\0~\0k\0q\0~sq\0~\0,W��q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0+org.enhydra.shark.xpdl.elements.Applicationv	�R��S\0\0xq\0~\0�t\0Applicationsq\0~\0R�l~q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0v�>q\0~t\0default_applicationpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�M*q\0~t\0\0pt\0Descriptionsq\0~\02\0q\0~\'sq\0~\0v�q\0~t\0\0t\0Choicesr\00org.enhydra.shark.xpdl.elements.ApplicationTypes�?�!���\0\0xr\0\'org.enhydra.shark.xpdl.XMLComplexChoice�|��\"��\0L\0choicesq\0~\0L\0choosenq\0~\0	xq\0~\0q\0~+sq\0~\0C��q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sr\00org.enhydra.shark.xpdl.elements.FormalParametersp��B�ÁZ\0\0xq\0~\0k\0t\0FormalParameterssq\0~\0��q\0~.t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~\0�\0t\0ExternalReferencesq\0~\0Yi�!q\0~.t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0|�S�q\0~9t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0s3e^q\0~9t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0fx�q\0~9t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~>q\0~Aq\0~Dxxq\0~3t\0ExtendedAttributessq\0~\0�\0q\0~Hsq\0~\0p�7�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~!q\0~$q\0~(q\0~.q\0~Ixxt\0\nDataFieldssr\0*org.enhydra.shark.xpdl.elements.DataFields���ʦ��U\0\0xq\0~\0k\0q\0~Osq\0~\0_;�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0WorkflowProcessessr\01org.enhydra.shark.xpdl.elements.WorkflowProcessesp�_�0,\0\0xq\0~\0k\0q\0~Vsq\0~\0{�u�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0/org.enhydra.shark.xpdl.elements.WorkflowProcess%�v0��L\0\0xq\0~\0�t\0WorkflowProcesssq\0~\0u�PPq\0~Xt\0\0sq\0~\0w\0\0\0\rq\0~\0sq\0~\0q\0~\0sq\0~\0P5�q\0~^t\0process1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0@��q\0~^t\0Proposal Approval Processpt\0AccessLevelsq\0~\0\0q\0~isq\0~\0<\n�+q\0~^q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0PUBLICt\0PRIVATExt\0\rProcessHeadersr\0-org.enhydra.shark.xpdl.elements.ProcessHeader�L��C-)�\0\0xq\0~\0q\0~osq\0~\0k��Cq\0~^t\0\0sq\0~\0w\0\0\0t\0DurationUnitsq\0~\0\0q\0~usq\0~\0L��q\0~qt\0hsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0Yt\0Mt\0Dt\0ht\0mt\0sxt\0Createdsq\0~\0-\0q\0~�sq\0~\0��q\0~qt\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0q\\��q\0~qt\0\0t\0Prioritysr\0(org.enhydra.shark.xpdl.elements.Priority`�Nn>b\0\0xq\0~\0#\0q\0~�sq\0~\0]��8q\0~qt\0\0t\0Limitsr\0%org.enhydra.shark.xpdl.elements.Limit���1�ӗ\0\0xq\0~\0#\0q\0~�sq\0~\0)4U�q\0~qt\0\0t\0	ValidFromsr\0)org.enhydra.shark.xpdl.elements.ValidFromcŅ|�L<\0\0xq\0~\0#\0q\0~�sq\0~\0H�q\0~qt\0\0t\0ValidTosr\0\'org.enhydra.shark.xpdl.elements.ValidTo����M�\0\0xq\0~\0#\0q\0~�sq\0~\0#�kq\0~qt\0\0t\0TimeEstimationsr\0.org.enhydra.shark.xpdl.elements.TimeEstimationŀ�\'3\0\0xq\0~\0\0q\0~�sq\0~\0Q�\'q\0~qt\0\0sq\0~\0w\0\0\0t\0WaitingTimesr\0+org.enhydra.shark.xpdl.elements.WaitingTimeN����/\0\0xq\0~\0#\0q\0~�sq\0~\0Z���q\0~�t\0\0t\0WorkingTimesr\0+org.enhydra.shark.xpdl.elements.WorkingTime�~����\0\0xq\0~\0#\0q\0~�sq\0~\0g�[�q\0~�t\0\0t\0Durationsr\0(org.enhydra.shark.xpdl.elements.Duration� �C���\0\0xq\0~\0#\0q\0~�sq\0~\0`���q\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~vq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0RedefinableHeadersq\0~\0H\0q\0~�sq\0~\0`�\Zq\0~^t\0\0sq\0~\0w\0\0\0q\0~\0Msq\0~\0\0q\0~\0Msq\0~\0u�q�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\0Rq\0~\0Sq\0~\0Txt\0Authorsq\0~\0V\0q\0~�sq\0~\00o�&q\0~�t\0\0t\0Versionsq\0~\0[\0q\0~�sq\0~\0�ݨq\0~�t\0\0t\0Codepagesq\0~\0`\0q\0~�sq\0~\0 #`q\0~�t\0\0t\0\nCountrykeysq\0~\0e\0q\0~�sq\0~\0F:<�q\0~�t\0\0t\0Responsiblessq\0~\0j\0q\0~�sq\0~\0\n�N�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0FormalParameterssq\0~2\0q\0~�sq\0~\0bq�q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0\nDataFieldssq\0~P\0q\0~�sq\0~\0Z���q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0)org.enhydra.shark.xpdl.elements.DataFieldI�3.~���\0\0xq\0~\0�t\0	DataFieldsq\0~\0J���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Ly>q\0~�t\0statuspq\0~\0sq\0~\0\0q\0~\0sq\0~\05�q\0~�t\0\0pt\0IsArraysq\0~\0\0q\0~�sq\0~\0wd��q\0~�t\0FALSEsq\0~\0E\0\0\0w\0\0\0t\0TRUEt\0FALSExt\0DataTypesr\0(org.enhydra.shark.xpdl.elements.DataType�\'4sM\0\0xq\0~\0q\0~�sq\0~\0&��q\0~�t\0\0sq\0~\0w\0\0\0t\0	DataTypessr\0)org.enhydra.shark.xpdl.elements.DataTypes�pcH,�!�\0Z\0\risInitializedxq\0~-q\0~�sq\0~\0Y�_�q\0~�t\0\0sq\0~\0E\0\0\0	w\0\0\0	sr\0)org.enhydra.shark.xpdl.elements.BasicType�)��w1��\0\0xq\0~\0t\0	BasicTypesq\0~\0	,#�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0u�q\0~�t\0STRINGsq\0~\0E\0\0\0w\0\0\0t\0STRINGt\0FLOATt\0INTEGERt\0	REFERENCEt\0DATETIMEt\0BOOLEANt\0	PERFORMERxxsq\0~\0E\0\0\0w\0\0\0q\0~xsr\0,org.enhydra.shark.xpdl.elements.DeclaredTypedR.\\^�9�\0\0xq\0~\0t\0DeclaredTypesq\0~\0^wr�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0U��:q\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~xsr\0*org.enhydra.shark.xpdl.elements.SchemaType&1oSH��\0\0xq\0~\0t\0\nSchemaTypesq\0~\0=��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~\0�t\0ExternalReferencesq\0~\0݇4q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0m[�Vq\0~ t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0t���q\0~ t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0M��q\0~ t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~%q\0~(q\0~+xsr\0*org.enhydra.shark.xpdl.elements.RecordType�%����K\0\0\0xq\0~\0kt\0\nRecordTypesq\0~\0)�F�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0)org.enhydra.shark.xpdl.elements.UnionType���5P�G�\0\0xq\0~\0kt\0	UnionTypesq\0~\03]�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0/org.enhydra.shark.xpdl.elements.EnumerationType����f3b\0\0xq\0~\0kt\0EnumerationTypesq\0~\0za�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0)org.enhydra.shark.xpdl.elements.ArrayTypeg�$\0�N@\0\0xq\0~\0t\0	ArrayTypesq\0~\0+��q\0~�t\0\0sq\0~\0w\0\0\0t\0\nLowerIndexsq\0~\0q\0~Jsq\0~\0(L�q\0~Et\0\0pt\0\nUpperIndexsq\0~\0q\0~Nsq\0~\0\Z��,q\0~Et\0\0pq\0~�sq\0~�q\0~�sq\0~\0d��q\0~Et\0\0ppxsq\0~\0E\0\0\0w\0\0\0q\0~Kq\0~Oq\0~Rxsr\0(org.enhydra.shark.xpdl.elements.ListType�\"ӟ\n�\0\0xq\0~\0t\0ListTypesq\0~\0X%��q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�q\0~�sq\0~\0�O�q\0~Wt\0\0ppxsq\0~\0E\0\0\0w\0\0\0q\0~\\xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0InitialValuesr\0,org.enhydra.shark.xpdl.elements.InitialValuej,z���R\0\0xq\0~\0#\0q\0~asq\0~\0-��q\0~�t\0\0t\0Lengthsr\0&org.enhydra.shark.xpdl.elements.LengthMW+-̩W�\0\0xq\0~\0#\0q\0~fsq\0~\0�O�q\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~ksq\0~\0g�9�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~osq\0~\0g�_nq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~cq\0~hq\0~lq\0~pxxt\0Participantssq\0~\0�\0q\0~vsq\0~\0M��q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Applicationssq\0~\0q\0~|sq\0~\0��xq\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ActivitySetssr\0,org.enhydra.shark.xpdl.elements.ActivitySets�qV[4���\0\0xq\0~\0k\0q\0~�sq\0~\0h�/q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0\nActivitiessr\0*org.enhydra.shark.xpdl.elements.Activities&G^�l�P\0\0xq\0~\0k\0q\0~�sq\0~\0}��q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0(org.enhydra.shark.xpdl.elements.Activity�t�45\Z9�\0\0xq\0~\0�t\0Activitysq\0~\0D��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0ou�q\0~�t\0approve_proposalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0Z<�q\0~�t\0Approve Proposalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0t��7q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0w;Xq\0~�t\0\0q\0~\0�sr\0-org.enhydra.shark.xpdl.elements.ActivityTypeseŽ{����\0\0xq\0~-q\0~\0�sq\0~\0*�Bq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sr\0%org.enhydra.shark.xpdl.elements.Route0e�\r�G�\0\0xq\0~\0t\0Routesq\0~\01N�	q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0.org.enhydra.shark.xpdl.elements.Implementation�r��^%�\0\0xq\0~\0t\0Implementationsq\0~\0y �5q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sr\03org.enhydra.shark.xpdl.elements.ImplementationTypes\r��T١9\0\0xq\0~-q\0~\0�sq\0~\0V���q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sr\0\"org.enhydra.shark.xpdl.elements.No{���.\0\0xq\0~\0t\0Nosq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0%org.enhydra.shark.xpdl.elements.ToolsC��g��\0\0xq\0~\0k\0t\0Toolssq\0~\0J�čq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0\'org.enhydra.shark.xpdl.elements.SubFlow;O�s�7:$\0\0xq\0~\0t\0SubFlowsq\0~\07��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0˭�q\0~�t\0\0pt\0	Executionsq\0~\0\0q\0~�sq\0~\0a�Loq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ASYNCHRt\0SYNCHRxt\0ActualParameterssr\00org.enhydra.shark.xpdl.elements.ActualParameters���_�K�\0\0xq\0~\0k\0q\0~�sq\0~\0\r�<uq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsr\0-org.enhydra.shark.xpdl.elements.BlockActivity�q�c��F\0\0xq\0~\0t\0\rBlockActivitysq\0~\0~�q\0~�t\0\0sq\0~\0w\0\0\0t\0BlockIdsq\0~\0q\0~�sq\0~\05�*yq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersr\0)org.enhydra.shark.xpdl.elements.Performer�\"1%���\0\0xq\0~\0#\0q\0~�sq\0~\0&ݵ�q\0~�t\0approvert\0	StartModesr\0)org.enhydra.shark.xpdl.elements.StartModenh����S\0\0xq\0~\0\0q\0~�sq\0~\0:@$�q\0~�t\0\0sq\0~\0w\0\0\0t\0Modesr\00org.enhydra.shark.xpdl.elements.StartFinishModes~�6z�X�\'\0\0xq\0~-\0q\0~�sq\0~\0<�V�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sr\0,org.enhydra.shark.xpdl.XMLEmptyChoiceElement�2�;�3�_\0\0xq\0~\0\0t\0XMLEmptyChoiceElementsq\0~\0~�ǌq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0)org.enhydra.shark.xpdl.elements.Automatic�t?�_��\0\0xq\0~\0t\0	Automaticsq\0~\0.&U*q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0&org.enhydra.shark.xpdl.elements.Manual�v���[ؤ\0\0xq\0~\0t\0Manualsq\0~\0dև\nq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0\nFinishModesr\0*org.enhydra.shark.xpdl.elements.FinishMode�������{\0\0xq\0~\0\0q\0~sq\0~\0ff>�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0�y)q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0.)q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0T��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0)��$q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0Prioritysq\0~�\0q\0~0sq\0~\0lܩ�q\0~�t\0\0t\0	Deadlinessr\0)org.enhydra.shark.xpdl.elements.Deadlines>��ɜ��\0\0xq\0~\0k\0q\0~4sq\0~\03�{q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsr\05org.enhydra.shark.xpdl.elements.SimulationInformation\"�|I���\0\0xq\0~\0\0q\0~;sq\0~\07J��q\0~�t\0\0sq\0~\0w\0\0\0t\0\rInstantiationsq\0~\0\0q\0~Asq\0~\0p���q\0~=q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ONCEt\0MULTIPLExt\0Costsr\0$org.enhydra.shark.xpdl.elements.Cost�����\0\0xq\0~\0#q\0~Gsq\0~\0y@��q\0~=t\0\0t\0TimeEstimationsq\0~�q\0~Lsq\0~\0r���q\0~=t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~Qsq\0~\0�qq\0~Mt\0\0t\0WorkingTimesq\0~�\0q\0~Usq\0~\0,�O�q\0~Mt\0\0t\0Durationsq\0~�\0q\0~Ysq\0~\0R~`�q\0~Mt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~Rq\0~Vq\0~Zxxsq\0~\0E\0\0\0w\0\0\0q\0~Bq\0~Iq\0~Mxt\0Iconsr\0$org.enhydra.shark.xpdl.elements.Icon�T�U(�}6\0\0xq\0~\0#\0q\0~_sq\0~\0|�q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~dsq\0~\0Ƀq\0~�t\0\0t\0TransitionRestrictionssr\06org.enhydra.shark.xpdl.elements.TransitionRestrictionsC)�׀i;\0\0xq\0~\0k\0q\0~hsq\0~\0J���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\05org.enhydra.shark.xpdl.elements.TransitionRestrictionN����}�\0\0xq\0~\0t\0TransitionRestrictionsq\0~\0,�J�q\0~jt\0\0sq\0~\0w\0\0\0t\0Joinsr\0$org.enhydra.shark.xpdl.elements.Joinڕөx)�5\0\0xq\0~\0\0q\0~usq\0~\0QkThq\0~pt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��Mq\0~wt\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ANDt\0XORxxsq\0~\0E\0\0\0w\0\0\0q\0~{xt\0Splitsr\0%org.enhydra.shark.xpdl.elements.Split��~ѯWS\0\0xq\0~\0\0q\0~�sq\0~\0<F��q\0~pt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0j+Q�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xt\0TransitionRefssr\0.org.enhydra.shark.xpdl.elements.TransitionRefs��ъ���\0\0xq\0~\0k\0q\0~�sq\0~\0a��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~wq\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0kV�2q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\01org.enhydra.shark.xpdl.elements.ExtendedAttribute��\\��F\0\0xq\0~\0t\0ExtendedAttributesq\0~\0\Z3Q�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0db8~q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpt\0Valuesq\0~\0\0q\0~�sq\0~\0<~9q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0t7�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0H��q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0a���q\0~�t\0189,51.79999084472655pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~1q\0~6q\0~=q\0~aq\0~eq\0~jq\0~�xsq\0~�t\0Activitysq\0~\07�Eq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0wB��q\0~�t\0approvalpq\0~\0sq\0~\0\0q\0~\0sq\0~\02K��q\0~�t\0Approvalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0bU��q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0d�6Sq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0_�� q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\00�^�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0|���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0�\n�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\00��Wq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0j+iq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\03�%�q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0\\���q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0nB>q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0J�\\q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0^�5Cq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersq\0~�\0q\0~sq\0~\0\r]9q\0~�t\0approvert\0	StartModesq\0~�\0q\0~sq\0~\0x��5q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\02��Vq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0�>�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0A��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0=�Ihq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0\nFinishModesq\0~\0q\0~#sq\0~\0gGq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0;\"�q\0~$t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0q���q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0W��0q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0)*�q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~,xsq\0~\0E\0\0\0w\0\0\0q\0~(xt\0Prioritysq\0~�\0q\0~?sq\0~\0]��q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~Csq\0~\0{��Cq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~Isq\0~\0!�}+q\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0_�j�q\0~Jq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~Qsq\0~\0=%X�q\0~Jt\0\0t\0TimeEstimationsq\0~�q\0~Usq\0~\0{6��q\0~Jt\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~Zsq\0~\01(֏q\0~Vt\0\0t\0WorkingTimesq\0~�\0q\0~^sq\0~\0EMmq\0~Vt\0\0t\0Durationsq\0~�\0q\0~bsq\0~\0R��.q\0~Vt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~[q\0~_q\0~cxxsq\0~\0E\0\0\0w\0\0\0q\0~Nq\0~Rq\0~Vxt\0Iconsq\0~`\0q\0~hsq\0~\0Hq\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~lsq\0~\0k�y�q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~psq\0~\0FI�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~ot\0TransitionRestrictionsq\0~\0\"��-q\0~qt\0\0sq\0~\0w\0\0\0t\0Joinsq\0~v\0q\0~{sq\0~\0L�%q\0~vt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\00��q\0~|q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Splitsq\0~�\0q\0~�sq\0~\0$�/q\0~vt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0nXf�q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xt\0TransitionRefssq\0~�\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0-org.enhydra.shark.xpdl.elements.TransitionRef�%-��a�\0\0xq\0~\0�t\0\rTransitionRefsq\0~\0�1q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�S�q\0~�t\0transition3pxsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rTransitionRefsq\0~\0o��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\07�i q\0~�t\0transition6pxsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rTransitionRefsq\0~\0=��0q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0R0�q\0~�t\0transition5pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~|q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0A1��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0ɧ�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0|��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0U��q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0xרyq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0;a�Mq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0U4I�q\0~�t\0430,62.79999084472655pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~$q\0~@q\0~Dq\0~Jq\0~iq\0~mq\0~qq\0~�xsq\0~�t\0Activitysq\0~\0O��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0PyU�q\0~�t\0	activity1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0Jwkq\0~�t\0Resubmit Proposalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0~�`�q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0	��Jq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0z�4�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0C���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\06K��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0Z���q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0S�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0@	�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0n�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0x>�hq\0~t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0f�\0q\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~\rsq\0~\0a���q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~\nq\0~xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0o�n^q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0ae�Lq\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\Zxxq\0~�t\0	Performersq\0~�\0q\0~sq\0~\0_@3q\0~�t\0	requestert\0	StartModesq\0~�\0q\0~\"sq\0~\0\"{W�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0>�awq\0~#t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\03�Tq\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0͛q\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0�<lq\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~+xsq\0~\0E\0\0\0w\0\0\0q\0~\'xt\0\nFinishModesq\0~\0q\0~>sq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0U�J�q\0~?t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\0\\�\0q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0\\��-q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0Oyq\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~Gxsq\0~\0E\0\0\0w\0\0\0q\0~Cxt\0Prioritysq\0~�\0q\0~Zsq\0~\04h��q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~^sq\0~\0S�Q�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~dsq\0~\0 ��Nq\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0P���q\0~eq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~lsq\0~\0 ���q\0~et\0\0t\0TimeEstimationsq\0~�q\0~psq\0~\0i�[q\0~et\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~usq\0~\0m���q\0~qt\0\0t\0WorkingTimesq\0~�\0q\0~ysq\0~\0:�6�q\0~qt\0\0t\0Durationsq\0~�\0q\0~}sq\0~\0$�Cq\0~qt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~vq\0~zq\0~~xxsq\0~\0E\0\0\0w\0\0\0q\0~iq\0~mq\0~qxt\0Iconsq\0~`\0q\0~�sq\0~\0C!��q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0r]��q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~�sq\0~\0��Rq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0�<q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0MY�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\0r�\"q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0RJnEq\0~�t\0	requesterpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0D�gq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0{��Gq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0o���q\0~�t\0397,20.787493896484378pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~#q\0~?q\0~[q\0~_q\0~eq\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0n��jq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0R��q\0~�t\0\rsend_proposalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\"E�q\0~�t\0\rSend Proposalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\07wL\Zq\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0��Iq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0}.q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0w�%q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0z� _q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\023��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0�Hq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0|\\N?q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0Ob3q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0`��Uq\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0�\'Oq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0-�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0dDP�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0r�Nzq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersq\0~�\0q\0~�sq\0~\0�?q\0~�t\0	requestert\0	StartModesq\0~�\0q\0~sq\0~\0p�b�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\06�6�q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0*�3�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0Dv\Zq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\01�aaq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0\nFinishModesq\0~\0q\0~sq\0~\0qAN�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0J�^q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0m�0q\0~#t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0�2�q\0~#t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0�j�q\0~#t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~\'xsq\0~\0E\0\0\0w\0\0\0q\0~#xt\0Prioritysq\0~�\0q\0~:sq\0~\07��q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~>sq\0~\0Ys�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~Dsq\0~\0t�q\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0xFjq\0~Eq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~Lsq\0~\0\\��q\0~Et\0\0t\0TimeEstimationsq\0~�q\0~Psq\0~\0^@q\0~Et\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~Usq\0~\0;	͝q\0~Qt\0\0t\0WorkingTimesq\0~�\0q\0~Ysq\0~\0s�V�q\0~Qt\0\0t\0Durationsq\0~�\0q\0~]sq\0~\0`�2q\0~Qt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~Vq\0~Zq\0~^xxsq\0~\0E\0\0\0w\0\0\0q\0~Iq\0~Mq\0~Qxt\0Iconsq\0~`\0q\0~csq\0~\0k�=q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~gsq\0~\0{��Hq\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~ksq\0~\0jPq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~qsq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0���q\0~rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0^_�q\0~wt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0?�r�q\0~wt\0	requesterpxsq\0~\0E\0\0\0w\0\0\0q\0~|q\0~xsq\0~�t\0ExtendedAttributesq\0~\0A��q\0~rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\'\nq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0z��q\0~�t\0#669.0000534057617,92.78333282470703pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~;q\0~?q\0~Eq\0~dq\0~hq\0~lq\0~rxsq\0~�t\0Activitysq\0~\0,N�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~�t\0parallelpq\0~\0sq\0~\0\0q\0~\0sq\0~\0��cq\0~�t\0Parallelpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0�Tq\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0P��q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\'�hbq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0#a�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0<�.�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0!��Vq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0-�=sq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0�ݰq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0y�5q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0]���q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0:M�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0p�hq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0 \\��q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersq\0~�\0q\0~�sq\0~\0#;{q\0~�t\0approvert\0	StartModesq\0~�\0q\0~�sq\0~\0v6�]q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0\r��Uq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\Z�b�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0MѰ�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0=��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0\nFinishModesq\0~\0q\0~�sq\0~\0r�Nq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0c�Yq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0	���q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0b�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0\0�T�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0Prioritysq\0~�\0q\0~\Zsq\0~\0|��q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~sq\0~\0P��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~$sq\0~\0BL��q\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0\0`S�q\0~%q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~,sq\0~\0b�q\0~%t\0\0t\0TimeEstimationsq\0~�q\0~0sq\0~\0U<��q\0~%t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~5sq\0~\0r�`	q\0~1t\0\0t\0WorkingTimesq\0~�\0q\0~9sq\0~\0p�X\"q\0~1t\0\0t\0Durationsq\0~�\0q\0~=sq\0~\0*���q\0~1t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~6q\0~:q\0~>xxsq\0~\0E\0\0\0w\0\0\0q\0~)q\0~-q\0~1xt\0Iconsq\0~`\0q\0~Csq\0~\0\ZAӞq\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~Gsq\0~\0;zr�q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~Ksq\0~\0a��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~ot\0TransitionRestrictionsq\0~\0J9�\"q\0~Lt\0\0sq\0~\0w\0\0\0t\0Joinsq\0~v\0q\0~Vsq\0~\0\0�W�q\0~Qt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0F��q\0~Wq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~[xt\0Splitsq\0~�\0q\0~_sq\0~\05��q\0~Qt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\01�\\�q\0~`t\0ANDsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xt\0TransitionRefssq\0~�\0q\0~hsq\0~\0c�;3q\0~`t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0\rTransitionRefsq\0~\0\'⺉q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0z/�q\0~nt\0transition7pxsq\0~\0E\0\0\0w\0\0\0q\0~sxsq\0~�t\0\rTransitionRefsq\0~\0,Ywq\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0A��fq\0~wt\0transition8pxsq\0~\0E\0\0\0w\0\0\0q\0~|xxxsq\0~\0E\0\0\0w\0\0\0q\0~dq\0~ixxsq\0~\0E\0\0\0w\0\0\0q\0~Wq\0~`xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0\\�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\07lM\nq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0O���q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\03�S�q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0�=q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0H�Ήq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0`�H�q\0~�t\0588,61.599993896484364pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~%q\0~Dq\0~Hq\0~Lq\0~�xsq\0~�t\0Activitysq\0~\0y�?q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0R�S�q\0~�t\0tool1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0*��!q\0~�t\0\ZSend Approval Notificationpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0$��xq\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0f��q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\06lv�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0[\\�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0)�]�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0r�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0W~��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0	�\\q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0$org.enhydra.shark.xpdl.elements.Tool\\6�&�+G�\0\0xq\0~\0�t\0Toolsq\0~\0.\0�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0CB��q\0~�t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0}_��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0APPLICATIONt\0	PROCEDURExt\0ActualParameterssq\0~�\0q\0~�sq\0~\0rC�Oq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0<7��q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0Cc��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�xxsq\0~�t\0SubFlowsq\0~\0o.�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0z]��q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0X.�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0	Lp�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0ӌ$q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0>hq\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\nxxq\0~�t\0	Performersq\0~�\0q\0~sq\0~\0)E<q\0~�t\0approvert\0	StartModesq\0~�\0q\0~sq\0~\0Cf��q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0I��oq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0q2�;q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0\\�]q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0\\ɭAq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0\nFinishModesq\0~\0q\0~.sq\0~\0�D<q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0ilq\0~/t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0XW%&q\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0f�`q\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0Y�/�q\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~7xsq\0~\0E\0\0\0w\0\0\0q\0~3xt\0Prioritysq\0~�\0q\0~Jsq\0~\0efW�q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~Nsq\0~\0y0=q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~Tsq\0~\0j=�q\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0R&�q\0~Uq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~\\sq\0~\0��oq\0~Ut\0\0t\0TimeEstimationsq\0~�q\0~`sq\0~\0H��?q\0~Ut\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~esq\0~\0J݌q\0~at\0\0t\0WorkingTimesq\0~�\0q\0~isq\0~\0(,hoq\0~at\0\0t\0Durationsq\0~�\0q\0~msq\0~\0y���q\0~at\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~fq\0~jq\0~nxxsq\0~\0E\0\0\0w\0\0\0q\0~Yq\0~]q\0~axt\0Iconsq\0~`\0q\0~ssq\0~\0L�u�q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~wsq\0~\0p�#q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~{sq\0~\0;�Bq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0eh�&q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0`�1q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0;b�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0/�s�q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\07\"|q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0K\0�q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0g[��q\0~�t\0735,63.974993896484364pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~/q\0~Kq\0~Oq\0~Uq\0~tq\0~xq\0~|q\0~�xsq\0~�t\0Activitysq\0~\0z1q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0t��dq\0~�t\0tool2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\'���q\0~�t\0Send Reject Notificationpt\0Descriptionsq\0~\02\0q\0~�sq\0~\03��q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0=��q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0%_�hq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0F���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0]=+�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0VX�Sq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0|Yq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0*}�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Toolsq\0~\0a�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0w��\0q\0~�t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0`��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0�!�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0bc؝q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0oq܉q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�xxsq\0~�t\0SubFlowsq\0~\0!|�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\01�<q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0H��Jq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0.M#q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0Jh�q\0~	t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~	xxq\0~�t\0	Performersq\0~�\0q\0~	\nsq\0~\0k���q\0~�t\0approvert\0	StartModesq\0~�\0q\0~	sq\0~\0O�9q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0xt��q\0~	t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0!@�q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0�L8q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0�!�q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~	xsq\0~\0E\0\0\0w\0\0\0q\0~	xt\0\nFinishModesq\0~\0q\0~	*sq\0~\0HB�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0~.�Yq\0~	+t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0(��q\0~	/t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0��eq\0~	/t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0Y�>Eq\0~	/t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~	3xsq\0~\0E\0\0\0w\0\0\0q\0~	/xt\0Prioritysq\0~�\0q\0~	Fsq\0~\0s@++q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~	Jsq\0~\0-2q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~	Psq\0~\0g\'|vq\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\07�%�q\0~	Qq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~	Xsq\0~\0E�Yoq\0~	Qt\0\0t\0TimeEstimationsq\0~�q\0~	\\sq\0~\0h[oaq\0~	Qt\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~	asq\0~\04�z�q\0~	]t\0\0t\0WorkingTimesq\0~�\0q\0~	esq\0~\0\"Oۤq\0~	]t\0\0t\0Durationsq\0~�\0q\0~	isq\0~\0d��q\0~	]t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~	bq\0~	fq\0~	jxxsq\0~\0E\0\0\0w\0\0\0q\0~	Uq\0~	Yq\0~	]xt\0Iconsq\0~`\0q\0~	osq\0~\0.w�	q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~	ssq\0~\0�T�q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~	wsq\0~\0]�=�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~	}sq\0~\0g�uzq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0Z��q\0~	~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�`�q\0~	�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0W?Y)q\0~	�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�xsq\0~�t\0ExtendedAttributesq\0~\0AR�q\0~	~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0$�q\0~	�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0J���q\0~	�t\0394,168.39999694824218pxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~	q\0~	q\0~	+q\0~	Gq\0~	Kq\0~	Qq\0~	pq\0~	tq\0~	xq\0~	~xsq\0~�t\0Activitysq\0~\0g�B�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0uN��q\0~	�t\0route1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0�ǩq\0~	�t\0Route 1pt\0Descriptionsq\0~\02\0q\0~	�sq\0~\066�q\0~	�t\0\0t\0Limitsq\0~�\0q\0~	�sq\0~\0Y\n��q\0~	�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0Dl��q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0vt�Oq\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0p��q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0|��-q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0]���q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0NI�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0cNE�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Y�MRq\0~	�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0RR|q\0~	�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~	�sq\0~\0//�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�q\0~	�xxq\0~	�xsq\0~\0E\0\0\0w\0\0\0q\0~	�xsq\0~�t\0\rBlockActivitysq\0~\0>]�tq\0~	�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0M�0q\0~	�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~	�xxq\0~	�t\0	Performersq\0~�\0q\0~	�sq\0~\0b�wq\0~	�t\0	requestert\0	StartModesq\0~�\0q\0~	�sq\0~\0[���q\0~	�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0H��q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0iEcq\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0<���q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0>�ɟq\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~	�xsq\0~\0E\0\0\0w\0\0\0q\0~	�xt\0\nFinishModesq\0~\0q\0~\n\nsq\0~\0z�!�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\09�M�q\0~\nt\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0:b��q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0���q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0$�Y1q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~\nxsq\0~\0E\0\0\0w\0\0\0q\0~\nxt\0Prioritysq\0~�\0q\0~\n&sq\0~\0A���q\0~	�t\0\0t\0	Deadlinessq\0~5\0q\0~\n*sq\0~\0lÛ�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~\n0sq\0~\0h�G�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0f�� q\0~\n1q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~\n8sq\0~\01$�q\0~\n1t\0\0t\0TimeEstimationsq\0~�q\0~\n<sq\0~\0Av��q\0~\n1t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~\nAsq\0~\0c#��q\0~\n=t\0\0t\0WorkingTimesq\0~�\0q\0~\nEsq\0~\0Z7[q\0~\n=t\0\0t\0Durationsq\0~�\0q\0~\nIsq\0~\0\"�<�q\0~\n=t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~\nBq\0~\nFq\0~\nJxxsq\0~\0E\0\0\0w\0\0\0q\0~\n5q\0~\n9q\0~\n=xt\0Iconsq\0~`\0q\0~\nOsq\0~\0V*pq\0~	�t\0\0t\0\rDocumentationsq\0~\07\0q\0~\nSsq\0~\0+D�q\0~	�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~\nWsq\0~\00�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~\n]sq\0~\0sA�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0|��q\0~\n^t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\04��3q\0~\nct\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0r���q\0~\nct\0	requesterpxsq\0~\0E\0\0\0w\0\0\0q\0~\nhq\0~\nkxsq\0~�t\0ExtendedAttributesq\0~\0\n^�q\0~\n^t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0a�wjq\0~\not\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0R��q\0~\not\0222,15pxsq\0~\0E\0\0\0w\0\0\0q\0~\ntq\0~\nwxxpxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~\nq\0~\n\'q\0~\n+q\0~\n1q\0~\nPq\0~\nTq\0~\nXq\0~\n^xxt\0Transitionssr\0+org.enhydra.shark.xpdl.elements.Transitions�9>��/i�\0\0xq\0~\0k\0q\0~\n|sq\0~\04	_pq\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0*org.enhydra.shark.xpdl.elements.Transitiont�x��\0\0xq\0~\0�t\0\nTransitionsq\0~\0k>x�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0%�2q\0~\n�t\0transition2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\\a� q\0~\n�t\0\0pt\0Fromsq\0~\0q\0~\n�sq\0~\0X�pq\0~\n�t\0approve_proposalpt\0Tosq\0~\0q\0~\n�sq\0~\06�7q\0~\n�t\0approvalpt\0	Conditionsr\0)org.enhydra.shark.xpdl.elements.Condition��D��Z;|\0\0xq\0~\0\0q\0~\n�sq\0~\0Duoq\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0Gz&�q\0~\n�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0	CONDITIONt\0	OTHERWISEt\0	EXCEPTIONt\0DEFAULTEXCEPTIONxxsq\0~\0E\0\0\0w\0\0\0q\0~\n�xt\0Descriptionsq\0~\02\0q\0~\n�sq\0~\0!�1�q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\n�sq\0~\0r��Jq\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0	��Uq\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0}�{q\0~\n�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\02�0q\0~\n�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�xsq\0~\n�t\0\nTransitionsq\0~\0*�D\\q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0A�/�q\0~\n�t\0transition3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0i\\q\0~\n�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0/\"fq\0~\n�t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0���q\0~\n�t\0	activity1pt\0	Conditionsq\0~\n�\0q\0~\n�sq\0~\0^�+q\0~\n�t\0status===\'resubmit\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\081�q\0~\n�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~\n�xt\0Descriptionsq\0~\02\0q\0~\n�sq\0~\0{b��q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\n�sq\0~\0?/�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0E���q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\00\Zi�q\0~\n�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0#=:�q\0~\n�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�xsq\0~\n�t\0\nTransitionsq\0~\0M[�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�׭q\0~\n�t\0transition4pq\0~\0sq\0~\0\0q\0~\0sq\0~\06m��q\0~\n�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0��q\0~\n�t\0	activity1pq\0~\n�sq\0~\0q\0~\n�sq\0~\0|LK�q\0~\n�t\0approve_proposalpt\0	Conditionsq\0~\n�\0q\0~\n�sq\0~\0	\0*�q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0@S-4q\0~\0q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~xt\0Descriptionsq\0~\02\0q\0~sq\0~\0^��,q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\09wq\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0��q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�/Zq\0~t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0F��iq\0~t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~\Zxxpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\0q\0~	q\0~\rxsq\0~\n�t\0\nTransitionsq\0~\01�]�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��jq\0~t\0transition6pq\0~\0sq\0~\0\0q\0~\0sq\0~\0eN�+q\0~t\0approvedpq\0~\n�sq\0~\0q\0~\n�sq\0~\0)i��q\0~t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\05��}q\0~t\0parallelpt\0	Conditionsq\0~\n�\0q\0~0sq\0~\0v��@q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�oq\0~1t\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~5xt\0Descriptionsq\0~\02\0q\0~:sq\0~\0Z�[q\0~t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~>sq\0~\0J�J�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0Z���q\0~?t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\07�vq\0~Dt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0�-�q\0~Dt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~Iq\0~Lxxpxsq\0~\0E\0\0\0w\0\0\0q\0~$q\0~\'q\0~*q\0~-q\0~1q\0~;q\0~?xsq\0~\n�t\0\nTransitionsq\0~\0X�e�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0k�q\0~Qt\0transition7pq\0~\0sq\0~\0\0q\0~\0sq\0~\0l<9�q\0~Qt\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0g���q\0~Qt\0parallelpq\0~\n�sq\0~\0q\0~\n�sq\0~\03�>�q\0~Qt\0\rsend_proposalpt\0	Conditionsq\0~\n�\0q\0~bsq\0~\0/���q\0~Qt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\07\"Q�q\0~cq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~gxt\0Descriptionsq\0~\02\0q\0~ksq\0~\0=h�q\0~Qt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~osq\0~\00���q\0~Qt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0���q\0~pt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0.{�q\0~ut\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\03C��q\0~ut\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~zq\0~}xxpxsq\0~\0E\0\0\0w\0\0\0q\0~Vq\0~Yq\0~\\q\0~_q\0~cq\0~lq\0~pxsq\0~\n�t\0\nTransitionsq\0~\0.��q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0@M&�q\0~�t\0transition8pq\0~\0sq\0~\0\0q\0~\0sq\0~\0R$�q\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0H+�q\0~�t\0parallelpq\0~\n�sq\0~\0q\0~\n�sq\0~\0=\n�]q\0~�t\0tool1pt\0	Conditionsq\0~\n�\0q\0~�sq\0~\0t7 q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0drOrq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0�R�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0��4q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\01�diq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��(q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0wᑎq\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\n�t\0\nTransitionsq\0~\0i�Rq\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0]�!�q\0~�t\0transition5pq\0~\0sq\0~\0\0q\0~\0sq\0~\0]�Gq\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0X�hZq\0~�t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0&e�q\0~�t\0tool2pt\0	Conditionsq\0~\n�\0q\0~�sq\0~\0,�q\0~�t\0status===\'rejected\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0 9!q\0~�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0.�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0o�{�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0\nJ�<q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0}��q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0.���q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\n�t\0\nTransitionsq\0~\0ayD?q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0zI)�q\0~�t\0transition1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0rj�q\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0<�2q\0~�t\0route1pq\0~\n�sq\0~\0q\0~\n�sq\0~\0K�q\0~�t\0approve_proposalpt\0	Conditionsq\0~\n�\0q\0~�sq\0~\0Yf�6q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\ZSEq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0NXu�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0C�Bq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0N�!�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0`�Q4q\0~	t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0��q\0~	t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~\0q\0~xxt\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0$5�q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0W���q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0h��!q\0~t\0%JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDERpq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~t\0requester;approverpxsq\0~\0E\0\0\0w\0\0\0q\0~!q\0~$xsq\0~�t\0ExtendedAttributesq\0~\0T׎q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0W��\rq\0~(t\0JaWE_GRAPH_START_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0r��pq\0~(t\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=route1,X_OFFSET=87,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~-q\0~0xsq\0~�t\0ExtendedAttributesq\0~\0�rq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0n+~�q\0~4t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\06���q\0~4t\0�JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=901,Y_OFFSET=74,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~9q\0~<xsq\0~�t\0ExtendedAttributesq\0~\0\")�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0u��q\0~@t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0@}��q\0~@t\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=send_proposal,X_OFFSET=809,Y_OFFSET=104,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~Eq\0~Hxsq\0~�t\0ExtendedAttributesq\0~\0\"�m�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0O�5�q\0~Lt\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0[�$q\0~Lt\0�JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=579,Y_OFFSET=180,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~Qq\0~Txxpxsq\0~\0E\0\0\0\rw\0\0\0\rq\0~cq\0~fq\0~jq\0~qq\0~�q\0~�q\0~�q\0~wq\0~}q\0~�q\0~�q\0~\n~q\0~xxt\0ExtendedAttributessq\0~\0�\0q\0~Ysq\0~\0\\�`,q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0|�	lq\0~Zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0hʺ�q\0~_t\0EDITING_TOOLpq\0~�sq\0~\0\0q\0~�sq\0~\0)P��q\0~_t\0Web Workflow Designerpxsq\0~\0E\0\0\0w\0\0\0q\0~dq\0~gxsq\0~�t\0ExtendedAttributesq\0~\08��+q\0~Zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0l�1q\0~kt\0EDITING_TOOL_VERSIONpq\0~�sq\0~\0\0q\0~�sq\0~\0Q�q\0~kt\0\r5.0-pre-alphapxsq\0~\0E\0\0\0w\0\0\0q\0~pq\0~sxxpxsq\0~\0E\0\0\0\rw\0\0\0\rq\0~\0q\0~\0q\0~\0q\0~\0Iq\0~\0tq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~q\0~Qq\0~Xq\0~Zx\0sq\0~\0w\0\0\0\0xt\01sr\0*org.enhydra.shark.xpdl.elements.Namespaces|��<.R��\0\0xq\0~\0kt\0\nNamespacessq\0~\0xkN�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0)org.enhydra.shark.xpdl.elements.Namespace�z��_\0\0xq\0~\0t\0	Namespacesq\0~\0:��aq\0~{t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\\�Wq\0~�t\0xpdlpq\0~\0�sq\0~\0q\0~\0�sq\0~\0@��q\0~�t\0 http://www.wfmc.org/2002/XPDL1.0pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xx',1000202,1,1000203,0);
/*!40000 ALTER TABLE `SHKXPDLData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLHistory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLHistory` (
  `XPDLId` varchar(90) NOT NULL,
  `XPDLVersion` varchar(20) NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `XPDLHistoryUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistory` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLHistory`
--

LOCK TABLES `SHKXPDLHistory` WRITE;
/*!40000 ALTER TABLE `SHKXPDLHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLHistoryData`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLHistoryData` (
  `XPDLContent` mediumblob NOT NULL,
  `XPDLClassContent` mediumblob NOT NULL,
  `XPDLHistory` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistoryData` (`CNT`),
  KEY `SHKXPDLHistoryData_XPDLHistory` (`XPDLHistory`),
  CONSTRAINT `SHKXPDLHistoryData_XPDLHistory` FOREIGN KEY (`XPDLHistory`) REFERENCES `SHKXPDLHistory` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLHistoryData`
--

LOCK TABLES `SHKXPDLHistoryData` WRITE;
/*!40000 ALTER TABLE `SHKXPDLHistoryData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLHistoryData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLParticipantPackage`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLParticipantPackage` (
  `PACKAGE_ID` varchar(90) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLParticipantPackage`
--

LOCK TABLES `SHKXPDLParticipantPackage` WRITE;
/*!40000 ALTER TABLE `SHKXPDLParticipantPackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLParticipantPackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLParticipantProcess`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLParticipantProcess` (
  `PROCESS_ID` varchar(90) NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLParticipantProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLParticipantProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLParticipantProcess`
--

LOCK TABLES `SHKXPDLParticipantProcess` WRITE;
/*!40000 ALTER TABLE `SHKXPDLParticipantProcess` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLParticipantProcess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLReferences`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLReferences` (
  `ReferredXPDLId` varchar(90) NOT NULL,
  `ReferringXPDL` decimal(19,0) NOT NULL,
  `ReferredXPDLNumber` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLReferences` (`ReferredXPDLId`,`ReferringXPDL`),
  KEY `SHKXPDLReferences_ReferringXPDL` (`ReferringXPDL`),
  CONSTRAINT `SHKXPDLReferences_ReferringXPDL` FOREIGN KEY (`ReferringXPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLReferences`
--

LOCK TABLES `SHKXPDLReferences` WRITE;
/*!40000 ALTER TABLE `SHKXPDLReferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLReferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SHKXPDLS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLS` (
  `XPDLId` varchar(90) NOT NULL,
  `XPDLVersion` varchar(20) NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLS` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SHKXPDLS`
--

LOCK TABLES `SHKXPDLS` WRITE;
/*!40000 ALTER TABLE `SHKXPDLS` DISABLE KEYS */;
INSERT INTO `SHKXPDLS` VALUES ('crm_community','1',1184650391000,'2017-11-09 05:52:43',1000202,0);
/*!40000 ALTER TABLE `SHKXPDLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_app`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_app` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `license` text,
  `description` longtext,
  `meta` longtext,
  PRIMARY KEY (`appId`,`appVersion`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_app`
--

LOCK TABLES `app_app` WRITE;
/*!40000 ALTER TABLE `app_app` DISABLE KEYS */;
INSERT INTO `app_app` VALUES ('appcenter',1,'App Center','','2017-11-09 13:54:46','2017-11-09 13:54:46','oRIgWuw8ed5OmS98TSZFxocskOFXU0v3VPneM0k80NqSBK2r6RhNzTNTryZkuj4W',NULL,NULL),('crm_community',1,'CRM Community','','2017-11-09 05:52:42','2017-11-09 05:52:44','Vfe6Df5AdlrGEPqFYgTt8XuGJ4XiTt2NnBLEovw3qoQ=',NULL,NULL);
/*!40000 ALTER TABLE `app_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_datalist`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_datalist` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `json` longtext,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK5E9247A6462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK5E9247A6462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_datalist`
--

LOCK TABLES `app_datalist` WRITE;
/*!40000 ALTER TABLE `app_datalist` DISABLE KEYS */;
INSERT INTO `app_datalist` VALUES ('crm_community',1,'crm_account_list','Account Listing',NULL,'{\"id\":\"crm_account_list\",\"name\":\"Account Listing\",\"hidePageSize\":\"\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"dateCreated\",\"description\":\"\",\"useSession\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[{\"id\":\"rowAction_0\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_list\",\"target\":\"_self\",\"hrefParam\":\"d-6304176-fn_account\",\"hrefColumn\":\"id\",\"label\":\"Contacts\",\"confirmation\":\"\",\"visible\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"},{\"id\":\"rowAction_1\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"fk_account\",\"hrefColumn\":\"id\",\"label\":\"New Contact\",\"confirmation\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"}],\"actions\":[{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_account\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"filters\":[{\"id\":\"filter_0\",\"label\":\"Account Name\",\"name\":\"accountName\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_account\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"id\",\"label\":\"ID\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"ID\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_1\",\"name\":\"accountName\",\"label\":\"Account Name\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_5\",\"name\":\"country\",\"label\":\"Country\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_4\",\"name\":\"state\",\"label\":\"State\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}]}','2017-11-09 05:52:42','2017-11-09 05:52:42'),('crm_community',1,'crm_contact_list','Contact List',NULL,'{\"id\":\"crm_contact_list\",\"name\":\"Contact List\",\"hidePageSize\":\"\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"dateCreated\",\"description\":\"\",\"useSession\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[{\"id\":\"rowAction_0\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Edit\",\"confirmation\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"}],\"actions\":[{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_contact\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"filters\":[{\"id\":\"filter_2\",\"name\":\"account\",\"filterParamName\":\"d-6304176-fn_account\",\"label\":\"Account\",\"type\":{\"className\":\"org.joget.plugin.enterprise.SelectBoxDataListFilterType\",\"properties\":{\"multiple\":\"autocomplete\",\"size\":\"\",\"defaultValue\":\"\",\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"filter_0\",\"name\":\"fullName\",\"label\":\"First Name\",\"type\":{\"className\":\"org.joget.apps.datalist.lib.TextFieldDataListFilterType\",\"properties\":{\"defaultValue\":\"\"}}},{\"id\":\"filter_1\",\"label\":\"Last Name\",\"name\":\"lastName\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_contact\"}},\"columns\":[{\"id\":\"column_2\",\"name\":\"account\",\"label\":\"Account\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"account\",\"label\":\"Account\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"org.joget.plugin.enterprise.OptionsValueFormatter\",\"properties\":{\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"column_0\",\"name\":\"fullName\",\"label\":\"First Name\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Full Name\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"name\":\"lastName\",\"label\":\"Last Name\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}]}','2017-11-09 05:52:42','2017-11-09 05:52:42'),('crm_community',1,'crm_opportunity_list','Opportunity List',NULL,'{\"id\":\"crm_opportunity_list\",\"name\":\"Opportunity List\",\"hidePageSize\":\"\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"dateCreated\",\"description\":\"\",\"useSession\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[],\"actions\":[{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_opportunity\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"filters\":[{\"id\":\"filter_1\",\"name\":\"account\",\"label\":\"Account\",\"type\":{\"className\":\"org.joget.plugin.enterprise.SelectBoxDataListFilterType\",\"properties\":{\"multiple\":\"textfield\",\"size\":\"\",\"defaultValue\":\"\",\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"filter_0\",\"label\":\"Title\",\"name\":\"title\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_opportunity\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"title\",\"label\":\"Title\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"opportunity_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Title\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"name\":\"account\",\"label\":\"Account\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"account\",\"label\":\"Account\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"org.joget.plugin.enterprise.OptionsValueFormatter\",\"properties\":{\"options\":[],\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"idColumn\":\"\",\"labelColumn\":\"accountName\",\"groupingColumn\":\"\",\"extraCondition\":\"\",\"addEmptyOption\":\"\",\"emptyLabel\":\"\",\"useAjax\":\"\"}}}}},{\"id\":\"column_2\",\"name\":\"amount\",\"label\":\"Amount\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_3\",\"name\":\"stage\",\"label\":\"Stage\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_1\",\"name\":\"dateModified\",\"label\":\"Date Modified\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}]}','2017-11-09 05:52:42','2017-11-09 05:52:42'),('crm_community',1,'Proposal','Proposal List',NULL,'{\"id\":\"Proposal\",\"name\":\"Proposal List\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"refNo\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"\",\"hidePageSize\":\"\",\"description\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[],\"actions\":[],\"filters\":[{\"id\":\"filter_2\",\"name\":\"account\",\"label\":\"Account\"},{\"id\":\"filter_1\",\"name\":\"title\",\"label\":\"Title\"},{\"id\":\"filter_0\",\"name\":\"status\",\"label\":\"Status\"}],\"binder\":{\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_proposal_approval_form\",\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"refNo\",\"label\":\"#\",\"sortable\":\"false\",\"hidden\":\"false\",\"exclude_export\":\"\",\"width\":\"\",\"style\":\"\",\"alignment\":\"\",\"headerAlignment\":\"\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_1\",\"label\":\"Account\",\"displayLabel\":\"Account\",\"name\":\"account\"},{\"id\":\"column_2\",\"datalist_type\":\"column\",\"name\":\"title\",\"label\":\"Title\",\"sortable\":\"false\",\"hidden\":\"false\",\"exclude_export\":\"\",\"width\":\"\",\"style\":\"\",\"alignment\":\"\",\"headerAlignment\":\"\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"ViewProposal\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"View\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_3\",\"label\":\"Description\",\"displayLabel\":\"Description\",\"name\":\"description\"},{\"id\":\"column_4\",\"label\":\"Status\",\"displayLabel\":\"Status\",\"name\":\"status\"},{\"id\":\"column_5\",\"label\":\"Date Modified\",\"displayLabel\":\"Date Modified\",\"name\":\"dateModified\"}]}','2017-11-09 05:52:42','2017-11-09 05:52:42');
/*!40000 ALTER TABLE `app_datalist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_env_variable`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_env_variable` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `value` text,
  `remarks` text,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK740A62EC462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK740A62EC462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_env_variable`
--

LOCK TABLES `app_env_variable` WRITE;
/*!40000 ALTER TABLE `app_env_variable` DISABLE KEYS */;
INSERT INTO `app_env_variable` VALUES ('crm_community',1,'AppName','Customer Relationship Management',NULL),('crm_community',1,'refNo','',NULL);
/*!40000 ALTER TABLE `app_env_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fd`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fd`
--

LOCK TABLES `app_fd` WRITE;
/*!40000 ALTER TABLE `app_fd` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fd_appcenter`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_appcenter` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fd_appcenter`
--

LOCK TABLES `app_fd_appcenter` WRITE;
/*!40000 ALTER TABLE `app_fd_appcenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_appcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fd_crm_account`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_account` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `c_country` longtext,
  `c_address` longtext,
  `c_accountName` longtext,
  `c_city` longtext,
  `c_state` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fd_crm_account`
--

LOCK TABLES `app_fd_crm_account` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fd_crm_contact`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_contact` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `c_lastName` longtext,
  `c_address` longtext,
  `c_city` longtext,
  `c_fullName` longtext,
  `c_photo` longtext,
  `c_state` longtext,
  `c_account` longtext,
  `c_addressAvailable` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fd_crm_contact`
--

LOCK TABLES `app_fd_crm_contact` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fd_crm_opportunity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_opportunity` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `c_amount` longtext,
  `c_stage` longtext,
  `c_description` longtext,
  `c_source` longtext,
  `c_newAccount` longtext,
  `c_title` longtext,
  `c_account` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fd_crm_opportunity`
--

LOCK TABLES `app_fd_crm_opportunity` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fd_crm_proposal`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_proposal` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `c_refNo` longtext,
  `c_comments` longtext,
  `c_notes` longtext,
  `c_attachment` longtext,
  `c_description` longtext,
  `c_title` longtext,
  `c_account` longtext,
  `c_status` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fd_crm_proposal`
--

LOCK TABLES `app_fd_crm_proposal` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_form`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_form` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `formId` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  `json` longtext,
  `description` longtext,
  PRIMARY KEY (`appId`,`appVersion`,`formId`),
  KEY `FK45957822462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK45957822462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_form`
--

LOCK TABLES `app_form` WRITE;
/*!40000 ALTER TABLE `app_form` DISABLE KEYS */;
INSERT INTO `app_form` VALUES ('appcenter',1,'landing','Published Apps','2017-11-09 13:54:46','2017-11-09 13:54:46','appcenter','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"landing\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"tableName\":\"appcenter\",\"description\":\"\",\"postProcessorRunOn\":\"both\",\"name\":\"Published Apps\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"postProcessor\":{\"className\":\"\",\"properties\":{}},\"permission\":{\"className\":\"\",\"properties\":{}},\"noPermissionMessage\":\"\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"admin_div\",\"autoPopulate\":\"\",\"value\":\"<style>\\n#appcenter_admin {\\n    text-align: center;\\n}\\n#appcenter_admin a {\\n    background: white;\\n    border: solid 1px #ddd;\\n    cursor: pointer;\\n    text-decoration: none;\\n    color: #555;\\n    margin-right: 5px;\\n    padding: 10px;\\n    box-shadow: 0 1px 1.5px 1px rgba(0,0,0,.12);\\n    border-radius: 4px;\\n    font-size: 14px;\\n    font-weight: 400;\\n    line-height: 1.42857143;\\n    display: inline-block;\\n}\\n@media (max-width:540px) {\\n    #appcenter_admin a {\\n        margin-top: -20px;\\n        margin-bottom: 20px;\\n    }\\n}\\n</style>\\n<div id=\\\"appcenter_admin\\\">\\n    <a href=\\\"#\\\" onclick=\\\"appCreate();return false\\\">#i18n.Design New App#</a>\\n    <a href=\\\"#\\\" onclick=\\\"appImport();return false\\\">#i18n.Import App#</a>\\n    <a href=\\\"#\\\" onclick=\'AdminBar.showQuickOverlay(\\\"/jw/web/desktop/marketplace/app?url=\\\" + encodeURIComponent(\\\"https://marketplace.joget.org\\\"));return false\'>#i18n.Download from Marketplace#</a>\\n</div>\",\"label\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"admin_section\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"permission\":{\"className\":\"org.joget.apps.userview.lib.BeanShellPermission\",\"properties\":{\"script\":\"import org.joget.workflow.util.WorkflowUtil;\\nreturn !WorkflowUtil.isCurrentUserAnonymous() && WorkflowUtil.isCurrentUserInRole(WorkflowUtil.ROLE_ADMIN);\\n\"}},\"label\":\"\",\"comment\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"published_apps\",\"autoPopulate\":\"\",\"value\":\"<link rel=\\\"stylesheet\\\" href=\\\"/jw/css/appCenter.css\\\" />\\n<div id=\\\"main-action-help\\\"><i class=\\\"fa fa-info-circle\\\"></i></div>\\n<div id=\\\"search\\\"></div>\\n<div id=\\\"apps\\\"></div>\\n<p>\\n<script src=\\\"/jw/js/appCenter.js\\\"></script>\\n<script>\\nAppCenter.searchFilter($(\\\"#search\\\"), $(\\\"#apps\\\")); \\nAppCenter.loadPublishedApps(\\\"#apps\\\");\\n</script>\\n</p>\",\"label\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"apps_section\",\"reverse\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"regex\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\",\"permission\":{\"className\":\"\",\"properties\":{}},\"join\":\"\"}}]}',NULL),('crm_community',1,'crm_account','Account Form','2017-11-09 05:52:42','2017-11-09 05:52:42','crm_account','{\n    \"className\": \"org.joget.apps.form.model.Form\",\n    \"properties\": {\n        \"id\": \"crm_account\",\n        \"loadBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        },\n        \"tableName\": \"crm_account\",\n        \"description\": \"\",\n        \"name\": \"Account Form\",\n        \"storeBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        }\n    },\n    \"elements\": [\n        {\n            \"elements\": [\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"id\",\n                                \"label\": \"Account ID\",\n                                \"size\": \"\",\n                                \"readonly\": \"\",\n                                \"validator\": {\n                                    \"className\": \"org.joget.apps.form.lib.DefaultValidator\",\n                                    \"properties\": {\n                                        \"mandatory\": \"true\",\n                                        \"type\": \"\"\n                                    }\n                                },\n                                \"workflowVariable\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"accountName\",\n                                \"label\": \"Account Name\",\n                                \"size\": \"\",\n                                \"readonly\": \"\",\n                                \"validator\": {\n                                    \"className\": \"org.joget.apps.form.lib.DefaultValidator\",\n                                    \"properties\": {\n                                        \"mandatory\": \"true\",\n                                        \"type\": \"\"\n                                    }\n                                },\n                                \"workflowVariable\": \"\"\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"99%\"\n                    }\n                }\n            ],\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"properties\": {\n                \"id\": \"account_details\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"visibilityControl\": \"\",\n                \"visibilityValue\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"label\": \"Account Details\"\n            }\n        },\n        {\n            \"elements\": [\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextArea\",\n                            \"properties\": {\n                                \"id\": \"address\",\n                                \"cols\": \"20\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"Address\",\n                                \"readonly\": \"\",\n                                \"rows\": \"5\"\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"49%\"\n                    }\n                },\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"city\",\n                                \"workflowVariable\": \"\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"City\",\n                                \"readonly\": \"\",\n                                \"size\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"state\",\n                                \"workflowVariable\": \"\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"State\",\n                                \"readonly\": \"\",\n                                \"size\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.SelectBox\",\n                            \"properties\": {\n                                \"id\": \"country\",\n                                \"workflowVariable\": \"\",\n                                \"optionsBinder\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"Country\",\n                                \"multiple\": \"\",\n                                \"readonly\": \"\",\n                                \"size\": \"\",\n                                \"options\": [\n                                    {\n                                        \"value\": \"\",\n                                        \"label\": \"\"\n                                    },\n                                    {\n                                        \"value\": \"local\",\n                                        \"label\": \"Local\"\n                                    },\n                                    {\n                                        \"value\": \"international\",\n                                        \"label\": \"International\"\n                                    }\n                                ]\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"49%\"\n                    }\n                }\n            ],\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"properties\": {\n                \"id\": \"address\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"visibilityControl\": \"\",\n                \"visibilityValue\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"label\": \"Address Details\"\n            }\n        }\n    ]\n}',NULL),('crm_community',1,'crm_contact','Contact Form','2017-11-09 05:52:42','2017-11-09 05:52:42','crm_contact','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_contact\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_contact\",\"name\":\"Contact Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"account\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"extraCondition\":\"\",\"labelColumn\":\"accountName\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"fullName\",\"workflowVariable\":\"\",\"readonlyLabel\":\"\",\"maxlength\":\"\",\"encryption\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"message\":\"\",\"custom-regex\":\"\",\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"First Name\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"lastName\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Last Name\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"addressAvailable\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Address Available\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"no\",\"label\":\"No\"},{\"value\":\"yes\",\"label\":\"Yes\"}]}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"photo\",\"label\":\"Photo\",\"readonly\":\"\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"contact_details\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Contact Details\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"address\",\"cols\":\"20\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{}},\"label\":\"Address\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"city\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"City\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"state\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"State\",\"readonly\":\"\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"address_details\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"addressAvailable\",\"visibilityValue\":\"yes\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Address Details\"}}]}',NULL),('crm_community',1,'crm_opportunity','Opportunity Form','2017-11-09 05:52:42','2017-11-09 05:52:42','crm_opportunity','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_opportunity\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_opportunity\",\"name\":\"Opportunity Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"title\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"label\":\"Title\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"description\",\"cols\":\"15\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Description\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"amount\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Amount\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"stage\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Stage\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"\",\"label\":\"\"},{\"value\":\"open\",\"label\":\"Open\"},{\"value\":\"won\",\"label\":\"Won\"},{\"value\":\"lost\",\"label\":\"Lost\"}]}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"source\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Source\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"\",\"label\":\"\"},{\"value\":\"direct\",\"label\":\"Direct\"},{\"value\":\"indirect\",\"label\":\"Indirect\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"opportunity\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Opportunity\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"newAccount\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{}},\"label\":\"New Account\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"value\":\"yes\",\"label\":\"Yes\"},{\"value\":\"no\",\"label\":\"No\"}],\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"accountChoice\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"account\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"extraCondition\":\"\",\"labelColumn\":\"accountName\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"account_existing\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"newAccount\",\"visibilityValue\":\"no\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Existing Account\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"account\",\"formDefId\":\"crm_account\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"account\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"script1\",\"validator\":{\"className\":\"\",\"properties\":{}},\"value\":\"<script>\\nvar val = $(\\\"#account_crm_accountid\\\").val();\\nif (val != \'\') {\\n    $(\\\"#newAccount\\\").val(\\\"no\\\");\\n    $(\\\"#newAccount\\\").trigger(\\\"change\\\");\\n}\\n<\\/script>\",\"label\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"account_new\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"newAccount\",\"visibilityValue\":\"yes\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\"}}]}',NULL),('crm_community',1,'crm_proposal_approval_form','Proposal Approval Form','2017-11-09 05:52:42','2017-11-09 05:52:42','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_approval_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Approval Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"proposal\",\"formDefId\":\"crm_proposal_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Approval\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"label\":\"Status\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"approved\",\"label\":\"Approved\"},{\"value\":\"resubmit\",\"label\":\"Resubmit\"},{\"value\":\"rejected\",\"label\":\"Rejected\"}]}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"comments\",\"cols\":\"20\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Approver Comments\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Approver Action\"}}]}',NULL),('crm_community',1,'crm_proposal_form','Proposal Form','2017-11-09 05:52:42','2017-11-09 05:52:42','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"name\":\"Proposal Form\",\"id\":\"crm_proposal_form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.IdGeneratorField\",\"properties\":{\"hidden\":\"true\",\"format\":\"????\",\"workflowVariable\":\"\",\"envVariable\":\"refNo\",\"id\":\"refNo\",\"label\":\"Reference No\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"readonly\":\"\",\"size\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"labelColumn\":\"accountName\",\"extraCondition\":\"\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"multiple\":\"\",\"options\":[],\"workflowVariable\":\"\",\"id\":\"account\",\"label\":\"Account\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"readonly\":\"\",\"size\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"type\":\"\",\"mandatory\":\"true\"}},\"workflowVariable\":\"\",\"id\":\"title\",\"label\":\"Title\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"readonly\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"workflowVariable\":\"\",\"id\":\"description\",\"label\":\"Description\",\"placeholder\":\"\",\"rows\":\"5\",\"value\":\"\",\"cols\":\"60\",\"readonlyLabel\":\"\"}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"attachment\":\"true\",\"readonly\":\"\",\"size\":\"\",\"id\":\"attachment\",\"label\":\"Attachment\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"visibilityControl\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"id\":\"section1\",\"label\":\"Proposal Form\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityValue\":\"\"}}]}',NULL),('crm_community',1,'crm_proposal_resubmit_form','Proposal Resubmit Form','2017-11-09 05:52:42','2017-11-09 05:52:42','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_resubmit_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Resubmit Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"approval\",\"formDefId\":\"crm_proposal_approval_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Resubmit\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"proposal\",\"formDefId\":\"crm_proposal_form\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"value\":\"pending\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Resubmission\"}}]}',NULL),('crm_community',1,'crm_proposal_sending_form','Proposal Sending Form','2017-11-09 05:52:42','2017-11-09 05:52:42','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_sending_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Sending Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"approval\",\"formDefId\":\"crm_proposal_approval_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Sending\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"notes\",\"cols\":\"20\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Notes\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\"}}]}',NULL);
/*!40000 ALTER TABLE `app_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_form_data_audit_trail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_form_data_audit_trail` (
  `id` varchar(255) NOT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  `formId` varchar(255) DEFAULT NULL,
  `tableName` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `data` longtext,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_form_data_audit_trail`
--

LOCK TABLES `app_form_data_audit_trail` WRITE;
/*!40000 ALTER TABLE `app_form_data_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_form_data_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_message`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_message` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) NOT NULL,
  `messageKey` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`appId`,`appVersion`,`ouid`),
  KEY `FKEE346FE9462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FKEE346FE9462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_message`
--

LOCK TABLES `app_message` WRITE;
/*!40000 ALTER TABLE `app_message` DISABLE KEYS */;
INSERT INTO `app_message` VALUES ('appcenter',1,'<i class=\'fa fa-home\'></i> Home_zh_CN','<i class=\'fa fa-home\'></i> Home','zh_CN','<i class=\'fa fa-home\'></i> 首页'),('appcenter',1,'<i class=\'fa fa-home\'></i> Home_zh_TW','<i class=\'fa fa-home\'></i> Home','zh_TW','<i class=\'fa fa-home\'></i> 首頁'),('appcenter',1,'App Center_zh_CN','App Center','zh_CN','应用中心'),('appcenter',1,'App Center_zh_TW','App Center','zh_TW','應用中心'),('appcenter',1,'Design New App_zh_CN','Design New App','zh_CN','设计新应用程序'),('appcenter',1,'Design New App_zh_TW','Design New App','zh_TW','設計新應用程序'),('appcenter',1,'Download from Marketplace_zh_CN','Download from Marketplace','zh_CN','应用市场'),('appcenter',1,'Download from Marketplace_zh_TW','Download from Marketplace','zh_TW','應用市場'),('appcenter',1,'Import App_zh_CN','Import App','zh_CN','导入应用'),('appcenter',1,'Import App_zh_TW','Import App','zh_TW','導入應用'),('appcenter',1,'Powered by Joget_zh_CN','Powered by Joget','zh_CN','由Joget技术支持'),('appcenter',1,'Powered by Joget_zh_TW','Powered by Joget','zh_TW','由Joget技術支持'),('appcenter',1,'Published Apps_zh_CN','Published Apps','zh_CN','本地已发布'),('appcenter',1,'Published Apps_zh_TW','Published Apps','zh_TW','本地已發布');
/*!40000 ALTER TABLE `app_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package` (
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`packageId`,`packageVersion`),
  KEY `FK852EA428462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK852EA428462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package`
--

LOCK TABLES `app_package` WRITE;
/*!40000 ALTER TABLE `app_package` DISABLE KEYS */;
INSERT INTO `app_package` VALUES ('crm_community',1,'CRM Community','2017-11-09 05:52:44','2017-11-09 05:52:44','crm_community',1);
/*!40000 ALTER TABLE `app_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package_activity_form`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_activity_form` (
  `processDefId` varchar(255) NOT NULL,
  `activityDefId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `formId` varchar(255) DEFAULT NULL,
  `formUrl` varchar(255) DEFAULT NULL,
  `formIFrameStyle` varchar(255) DEFAULT NULL,
  `autoContinue` bit(1) DEFAULT NULL,
  `disableSaveAsDraft` bit(1) DEFAULT NULL,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKA8D741D5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKA8D741D5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package_activity_form`
--

LOCK TABLES `app_package_activity_form` WRITE;
/*!40000 ALTER TABLE `app_package_activity_form` DISABLE KEYS */;
INSERT INTO `app_package_activity_form` VALUES ('process1','activity1','crm_community',1,'process1::activity1','SINGLE','crm_proposal_resubmit_form',NULL,NULL,'','\0'),('process1','approve_proposal','crm_community',1,'process1::approve_proposal','SINGLE','crm_proposal_approval_form',NULL,NULL,'','\0'),('process1','runProcess','crm_community',1,'process1::runProcess','SINGLE','crm_proposal_form',NULL,NULL,'','\0'),('process1','send_proposal','crm_community',1,'process1::send_proposal','SINGLE','crm_proposal_sending_form',NULL,NULL,'','\0');
/*!40000 ALTER TABLE `app_package_activity_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package_activity_plugin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_activity_plugin` (
  `processDefId` varchar(255) NOT NULL,
  `activityDefId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `pluginName` varchar(255) DEFAULT NULL,
  `pluginProperties` text,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKADE8644C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKADE8644C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package_activity_plugin`
--

LOCK TABLES `app_package_activity_plugin` WRITE;
/*!40000 ALTER TABLE `app_package_activity_plugin` DISABLE KEYS */;
INSERT INTO `app_package_activity_plugin` VALUES ('process1','tool1','crm_community',1,'process1::tool1','org.joget.apps.app.lib.EmailTool','{\"toSpecific\":\"jogetgo@gmail.com\",\"toParticipantId\":\"jogetgo@gmail.com\",\"cc\":\"\",\"bcc\":\"\",\"subject\":\"Proposal Approved: #form.crm_proposal.title#\",\"message\":\"Proposal Approved\\n\\nRef No: #form.crm_proposal.refNo#\\nTitle: #form.crm_proposal.title#\",\"isHtml\":\"\",\"from\":\"jogetgo@gmail.com\",\"host\":\"smtp.gmail.com\",\"port\":\"465\",\"security\":\"SSL\",\"username\":\"jogetgo@gmail.com\",\"password\":\"2017Jogetg0\",\"formDefId\":\"\",\"fields\":[],\"files\":[],\"icsAttachement\":\"\"}'),('process1','tool2','crm_community',1,'process1::tool2','org.joget.apps.app.lib.EmailTool','{\"toSpecific\":\"jogetgo@gmail.com\",\"toParticipantId\":\"\",\"cc\":\"\",\"bcc\":\"\",\"subject\":\"Proposal Rejected: #form.crm_proposal.title#\",\"message\":\"Proposal Rejected\\n\\nRef No: #form.crm_proposal.refNo#\\nTitle: #form.crm_proposal.title#\",\"isHtml\":\"\",\"from\":\"jogetgo@gmail.com\",\"host\":\"smtp.gmail.com\",\"port\":\"465\",\"security\":\"SSL\",\"username\":\"jogetgo@gmail.com\",\"password\":\"2017Jogetg0\",\"formDefId\":\"\",\"fields\":[],\"files\":[],\"icsAttachement\":\"\"}');
/*!40000 ALTER TABLE `app_package_activity_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_package_participant`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_participant` (
  `processDefId` varchar(255) NOT NULL,
  `participantId` varchar(255) NOT NULL,
  `packageId` varchar(255) NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` text,
  `pluginProperties` text,
  PRIMARY KEY (`processDefId`,`participantId`,`packageId`,`packageVersion`),
  KEY `FK6D7BF59C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FK6D7BF59C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_package_participant`
--

LOCK TABLES `app_package_participant` WRITE;
/*!40000 ALTER TABLE `app_package_participant` DISABLE KEYS */;
INSERT INTO `app_package_participant` VALUES ('process1','approver','crm_community',1,'process1::approver','requesterHod',NULL,NULL),('process1','processStartWhiteList','crm_community',1,'process1::processStartWhiteList','role','loggedInUser',NULL),('process1','requester','crm_community',1,'process1::requester','requester','runProcess',NULL);
/*!40000 ALTER TABLE `app_package_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_plugin_default`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_plugin_default` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `pluginName` varchar(255) DEFAULT NULL,
  `pluginDescription` text,
  `pluginProperties` text,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK7A835713462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK7A835713462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_plugin_default`
--

LOCK TABLES `app_plugin_default` WRITE;
/*!40000 ALTER TABLE `app_plugin_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plugin_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_activity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_activity` (
  `uuid` varchar(255) NOT NULL,
  `activityDefId` varchar(255) DEFAULT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `processUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK5E33D79C918F93D` (`processUid`),
  CONSTRAINT `FK5E33D79C918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_activity`
--

LOCK TABLES `app_report_activity` WRITE;
/*!40000 ALTER TABLE `app_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_activity_instance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_activity_instance` (
  `instanceId` varchar(255) NOT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) DEFAULT NULL,
  `assignmentUsers` text,
  `due` datetime DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromCreatedTime` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `activityUid` varchar(255) DEFAULT NULL,
  `processInstanceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK9C6ABDD8B06E2043` (`activityUid`),
  KEY `FK9C6ABDD8D4610A90` (`processInstanceId`),
  CONSTRAINT `FK9C6ABDD8B06E2043` FOREIGN KEY (`activityUid`) REFERENCES `app_report_activity` (`uuid`),
  CONSTRAINT `FK9C6ABDD8D4610A90` FOREIGN KEY (`processInstanceId`) REFERENCES `app_report_process_instance` (`instanceId`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_activity_instance`
--

LOCK TABLES `app_report_activity_instance` WRITE;
/*!40000 ALTER TABLE `app_report_activity_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_app`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_app` (
  `uuid` varchar(255) NOT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  `appName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_app`
--

LOCK TABLES `app_report_app` WRITE;
/*!40000 ALTER TABLE `app_report_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_package`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_package` (
  `uuid` varchar(255) NOT NULL,
  `packageId` varchar(255) DEFAULT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  `packageVersion` varchar(255) DEFAULT NULL,
  `appUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKBD580A19E475ABC` (`appUid`),
  CONSTRAINT `FKBD580A19E475ABC` FOREIGN KEY (`appUid`) REFERENCES `app_report_app` (`uuid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_package`
--

LOCK TABLES `app_report_package` WRITE;
/*!40000 ALTER TABLE `app_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_process`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_process` (
  `uuid` varchar(255) NOT NULL,
  `processDefId` varchar(255) DEFAULT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `packageUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKDAFFF442D40695DD` (`packageUid`),
  CONSTRAINT `FKDAFFF442D40695DD` FOREIGN KEY (`packageUid`) REFERENCES `app_report_package` (`uuid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_process`
--

LOCK TABLES `app_report_process` WRITE;
/*!40000 ALTER TABLE `app_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_report_process_instance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_process_instance` (
  `instanceId` varchar(255) NOT NULL,
  `requester` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `processUid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK351D7BF2918F93D` (`processUid`),
  CONSTRAINT `FK351D7BF2918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_report_process_instance`
--

LOCK TABLES `app_report_process_instance` WRITE;
/*!40000 ALTER TABLE `app_report_process_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_resource`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_resource` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `permissionClass` varchar(255) DEFAULT NULL,
  `permissionProperties` longtext,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  CONSTRAINT `FK_nnvkg0h6yy8o3f4yjhd20ury0` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_resource`
--

LOCK TABLES `app_resource` WRITE;
/*!40000 ALTER TABLE `app_resource` DISABLE KEYS */;
INSERT INTO `app_resource` VALUES ('crm_community',1,'crm_icon.jpg',29662,NULL,'{\"permission\": { \"className\": \"\", \"properties\": {}}}');
/*!40000 ALTER TABLE `app_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_userview`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_userview` (
  `appId` varchar(255) NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `json` longtext,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FKE411D54E462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FKE411D54E462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_userview`
--

LOCK TABLES `app_userview` WRITE;
/*!40000 ALTER TABLE `app_userview` DISABLE KEYS */;
INSERT INTO `app_userview` VALUES ('appcenter',1,'v','Joget Workflow',NULL,'{\"className\":\"org.joget.apps.userview.model.Userview\",\"properties\":{\"id\":\"v\",\"name\":\"Joget Workflow\",\"description\":\"\",\"welcomeMessage\":\"#date.EEE, d MMM yyyy#\",\"logoutText\":\"Logout\",\"footerMessage\":\"#i18n.Powered by Joget#\"},\"setting\":{\"properties\":{\"theme\":{\"className\":\"org.joget.plugin.enterprise.UniversalTheme\",\"properties\":{\"horizontal_menu\":\"horizontal_inline\",\"themeScheme\":\"light\",\"primaryColor\":\"custom\",\"customPrimary\":\"#7CA6D8\",\"customPrimaryDark\":\"\",\"customPrimaryLight\":\"\",\"accentColor\":\"BLUE\",\"buttonColor\":\"GREY\",\"buttonTextColor\":\"WHITE\",\"menuFontColor\":\"BLACK\",\"fontColor\":\"WHITE\",\"fav_icon\":\"\",\"logo\":\"\\/jw\\/images\\/v3\\/logo.png\",\"profile\":\"\",\"userImage\":\"\",\"inbox\":\"all\",\"shortcutLinkLabel\":\"Shortcut\",\"shortcut\":[],\"userMenu\":[],\"enableResponsiveSwitch\":\"true\",\"removeAssignmentTitle\":\"\",\"homeAttractBanner\":\"<div id=\\\"banner\\\"><h1>#i18n.App Center#<\\/h1><\\/div>\",\"css\":\"\\/* banner image and title *\\/\\n#banner {\\n    background: url(\\/jw\\/home\\/banner.jpg);\\n    background-size: cover;\\n    height: 240px;\\n    width: 100%;\\n}\\n#banner h1 {\\n    margin-top: 0px;\\n    padding-top: 20px;\\n    color: white;\\n    text-align: center;\\n}\\nbody#home ul.breadcrumb {\\n    display: none;\\n}\\n\\n\\/* admin buttons *\\/\\n#appcenter_admin {\\n    position: absolute;\\n    top: -120px;\\n    text-align: center;\\n    display: block;\\n    margin: auto;\\n    width: 100%;\\n}\\n#admin_section, #admin_section .form-column, #admin_section .form-cell, #admin_section .form-cell-value {\\n    padding: 0px;\\n    margin: 0px;\\n    height: 0px;\\n}\\n@media (max-width: 540px) {\\n    #appcenter_admin {    \\n        top: -150px;\\n    }\\n}\\n\",\"js\":\"\",\"subheader\":\"\",\"subfooter\":\"\",\"disableHelpGuide\":\"\",\"loginPageTop\":\"\",\"loginPageBottom\":\"\"}},\"userviewDescription\":\"\",\"userview_thumbnail\":\"\",\"hideThisUserviewInAppCenter\":\"true\",\"permission\":{\"className\":\"\",\"properties\":{}},\"__\":\"\"}},\"categories\":[{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-EE74E4F4426241BD9BC3BC73B1D24AC7\",\"label\":\"<i class=\'fa fa-home\'><\\/i> Home\"},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"28F7ADF73F204C8BBAAD32CF26587AE2\",\"customId\":\"home\",\"label\":\"Published Apps\",\"formId\":\"landing\",\"showInPopupDialog\":\"\",\"readonly\":\"\",\"readonlyLabel\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"\",\"redirectUrlOnCancel\":\"\",\"redirectTargetOnCancel\":\"top\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}]}]}','2017-11-09 13:54:46','2017-11-09 13:54:46'),('crm_community',1,'crm_userview_sales','Customer Relationship Management',NULL,'{\"className\":\"org.joget.apps.userview.model.Userview\",\"properties\":{\"id\":\"crm_userview_sales\",\"name\":\"Customer Relationship Management\",\"description\":\"\",\"welcomeMessage\":\"Sales Force Automation\",\"logoutText\":\"Logout\",\"footerMessage\":\"Powered by Joget\"},\"layout\":{\"className\":\"org.joget.apps.userview.model.UserviewLayout\",\"properties\":{\"customHeader\":\"\",\"customFooter\":\"\",\"beforeMenu\":\"\",\"afterMenu\":\"\",\"theme\":{\"className\":\"org.joget.apps.userview.lib.DefaultTheme\",\"properties\":{\"css\":\"\",\"js\":\"\"}}}},\"categories\":[{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-9BE91A55FAAC4B5098841EA9E1994BE6\",\"label\":\"Home\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.plugin.enterprise.AnonymousUserviewPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.HtmlPage\",\"properties\":{\"id\":\"welcome\",\"customId\":\"welcome\",\"label\":\"Welcome\",\"content\":\"<div id=\\\"left_content\\\">\\n<div style=\\\"float: left; width: 400px; margin-right: 10px;\\\">\\n<h4 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-size: inherit; line-height: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; font-weight: bold; color: #042c54;\\\">More Leads, More Sales, More Customers<\\/h4>\\n<h1 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font: inherit; vertical-align: baseline; color: #1f4282;\\\"><span style=\\\"font-size: large;\\\"><strong>Business&nbsp;Customer Relationship Management<\\/strong><\\/span><\\/h1>\\n<p style=\\\"margin: 0px; padding: 30px 0px 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; color: #363636; line-height: 15px;\\\">CRM helps your business communicate with prospects, share sales information, close deals and keep customers happy.<img src=\\\"http:\\/\\/www.joget.org\\/images\\/demo\\/phone_pad.png\\\" alt=\\\"\\\" width=\\\"382\\\" height=\\\"302\\\" \\/><\\/p>\\n<\\/div>\\n<\\/div>\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-7650DEEFC4CC4332AC25871B65BBDD48\",\"label\":\"Accounts\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.DataListMenu\",\"properties\":{\"id\":\"384344BD3E2946D097C6F5F17540C377\",\"customId\":\"account_list\",\"label\":\"Account List\",\"datalistId\":\"crm_account_list\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"selectionType\":\"multiple\",\"checkboxPosition\":\"left\",\"customHeader\":\"<h2>Account List<\\/h2>\",\"customFooter\":\"\",\"keyName\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}},{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"account_form\",\"customId\":\"account_new\",\"label\":\"New Account\",\"formId\":\"crm_account\",\"showInPopupDialog\":\"\",\"readonly\":\"\",\"readonlyLabel\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"account_list\",\"redirectUrlOnCancel\":\"account_list\",\"redirectTargetOnCancel\":\"top\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-E77D2050680D4DB0A85A5C0C3AC1C083\",\"label\":\"Contacts\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.DataListMenu\",\"properties\":{\"id\":\"D86B740C970C4B08B4D5CCD3DC0E9503\",\"customId\":\"contact_list\",\"label\":\"Contact List\",\"datalistId\":\"crm_contact_list\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"selectionType\":\"multiple\",\"checkboxPosition\":\"left\",\"customHeader\":\"<h2>Contact List<\\/h2>\",\"customFooter\":\"\",\"keyName\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}},{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"contact-form\",\"customId\":\"contact_new\",\"label\":\"New Contact\",\"formId\":\"crm_contact\",\"showInPopupDialog\":\"\",\"readonly\":\"\",\"readonlyLabel\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"contact_list\",\"redirectUrlOnCancel\":\"contact_list\",\"redirectTargetOnCancel\":\"top\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-A12DBDB14B4447A984E6095B77F28B42\",\"label\":\"Opportunities\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.DataListMenu\",\"properties\":{\"id\":\"A074397ABEA94CF78E2E8FA0843AB97B\",\"customId\":\"opportunity_list\",\"label\":\"Opportunity List\",\"datalistId\":\"crm_opportunity_list\",\"rowCount\":\"true\",\"buttonPosition\":\"bottomLeft\",\"selectionType\":\"multiple\",\"checkboxPosition\":\"left\",\"customHeader\":\"<h2>Opportunity List<\\/h2>\",\"customFooter\":\"\",\"keyName\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}},{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"0C7E36768A2F46BB945CEC50E62E0BE8\",\"customId\":\"opportunity_new\",\"label\":\"New Opportunity\",\"formId\":\"crm_opportunity\",\"showInPopupDialog\":\"\",\"readonly\":\"\",\"readonlyLabel\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"opportunity_list\",\"redirectUrlOnCancel\":\"opportunity_list\",\"redirectTargetOnCancel\":\"top\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}],\"permission\":{\"className\":\"org.joget.apps.userview.model.UserviewPermission\",\"properties\":{}}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-78EC0B8A1E8E483A93770714BB0D6F6E\",\"label\":\"Proposal Process\",\"hide\":\"\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}}},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.DataListMenu\",\"properties\":{\"id\":\"9E98D32002434ABFAABA3649DCA300F5\",\"customId\":\"view_all_proposal\",\"label\":\"View All Proposals\",\"datalistId\":\"Proposal\",\"rowCount\":\"true\",\"buttonPosition\":\"topLeft\",\"selectionType\":\"multiple\",\"checkboxPosition\":\"no\",\"customHeader\":\"<h2>View All Proposals<\\/h2>\",\"customFooter\":\"\",\"keyName\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}},{\"className\":\"org.joget.apps.userview.lib.InboxMenu\",\"properties\":{\"id\":\"AA1445B29D904408B3F2B1B36E469E16\",\"customId\":\"workflow_inbox\",\"label\":\"Task Inbox\",\"appFilter\":\"process\",\"processId\":\"process1\",\"rowCount\":\"true\",\"buttonPosition\":\"topLeft\",\"list-customHeader\":\"<h2>Task Inbox<\\/h2>\\nReminder to administrator for email notification to work:<br\\/>\\n<ul>\\n\\n<li>Input the admin email address in <a href=\\\"\\/jw\\/web\\/console\\/directory\\/users\\\" target=\\\"_blank\\\">Setup Users<\\/a>.<\\/li>\\n<li>Input your email SMTP credentials into the <a href=\\\"\\/jw\\/web\\/console\\/app\\/crm\\/1\\/processes\\/process1\\\" target=\\\"_blank\\\">Process Email Tool<\\/a>.<\\/li>\\n<\\/ul>\",\"list-customFooter\":\"\",\"assignment-customHeader\":\"\",\"assignment-customFooter\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}},{\"className\":\"org.joget.apps.userview.lib.RunProcess\",\"properties\":{\"id\":\"2D27B3875F234315A7A3562BD0E35AB2\",\"customId\":\"proposal_process\",\"label\":\"Submit New Proposal\",\"processDefId\":\"process1\",\"runProcessDirectly\":\"Yes\",\"showInPopupDialog\":\"\",\"runProcessSubmitLabel\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"view_all_proposal\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"keyName\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}]},{\"menus\":[{\"className\":\"org.joget.apps.userview.lib.HtmlPage\",\"properties\":{\"id\":\"765269E3926049B0A21D16581EE188DF\",\"customId\":\"about\",\"label\":\"About\",\"content\":\"<div id=\\\"left_content\\\">\\n<div style=\\\"float: left; width: 400px; margin-right: 10px;\\\">\\n<h4 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-size: inherit; line-height: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; font-weight: bold; color: #042c54;\\\">More Leads, More Sales, More Customers<\\/h4>\\n<h1 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font: inherit; vertical-align: baseline; color: #1f4282;\\\"><span style=\\\"font-size: large;\\\"><strong>Business&nbsp;Customer Relationship Management<\\/strong><\\/span><\\/h1>\\n<p style=\\\"margin: 0px; padding: 30px 0px 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; color: #363636; line-height: 15px;\\\">CRM helps your business communicate with prospects, share sales information, close deals and keep customers happy.<img src=\\\"http:\\/\\/www.joget.org\\/images\\/demo\\/phone_pad.png\\\" alt=\\\"\\\" width=\\\"382\\\" height=\\\"302\\\" \\/><\\/p>\\n<\\/div>\\n<\\/div>\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}],\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-8739F2859D894A339404C2404CB9004E\",\"hide\":\"\",\"permission\":{\"className\":\"\",\"properties\":{}},\"label\":\" \"}},{\"className\":\"org.joget.apps.userview.model.UserviewCategory\",\"properties\":{\"id\":\"category-1AFAC018AFA848F2970403061E49EE72\",\"label\":\"Hidden\",\"hide\":\"yes\",\"permission\":{\"className\":\"org.joget.apps.userview.lib.LoggedInUserPermission\",\"properties\":{}},\"comment\":\"\"},\"menus\":[{\"className\":\"org.joget.apps.userview.lib.FormMenu\",\"properties\":{\"id\":\"1A2E6106918040F484C342E1BB12B2A3\",\"customId\":\"ViewProposal\",\"label\":\"View Proposal\",\"formId\":\"crm_proposal_approval_form\",\"showInPopupDialog\":\"\",\"readonly\":\"Yes\",\"readonlyLabel\":\"\",\"messageShowAfterComplete\":\"\",\"redirectUrlAfterComplete\":\"view_all_proposal\",\"redirectUrlOnCancel\":\"view_all_proposal\",\"redirectTargetOnCancel\":\"top\",\"fieldPassover\":\"\",\"fieldPassoverMethod\":\"append\",\"paramName\":\"\",\"submitButtonLabel\":\"\",\"cancelButtonLabel\":\"\",\"customHeader\":\"\",\"customFooter\":\"\",\"keyName\":\"\",\"loadDataWithKey\":\"\",\"userviewCacheScope\":\"\",\"userviewCacheDuration\":\"20\"}}]}],\"setting\":{\"className\":\"org.joget.apps.userview.model.UserviewSetting\",\"properties\":{\"theme\":{\"className\":\"org.joget.plugin.enterprise.UniversalTheme\",\"properties\":{\"horizontal_menu\":\"true\",\"themeScheme\":\"light\",\"primaryColor\":\"DARKROYALBLUE\",\"accentColor\":\"BLUE\",\"buttonColor\":\"GREY\",\"buttonTextColor\":\"WHITE\",\"menuFontColor\":\"BLACK\",\"fontColor\":\"WHITE\",\"fav_icon\":\"\",\"logo\":\"\",\"profile\":\"\",\"userImage\":\"\",\"inbox\":\"current\",\"shortcutLinkLabel\":\"Shortcut\",\"shortcut\":[],\"userMenu\":[],\"enableResponsiveSwitch\":\"true\",\"removeAssignmentTitle\":\"true\",\"homeAttractBanner\":\"\",\"css\":\"\",\"js\":\"\",\"subheader\":\"\",\"subfooter\":\"\",\"disableHelpGuide\":\"\",\"loginPageTop\":\"\",\"loginPageBottom\":\"\"}},\"userviewDescription\":\"\",\"userview_thumbnail\":\"#appResource.crm_icon.jpg#\",\"hideThisUserviewInAppCenter\":\"\",\"permission\":{\"className\":\"\",\"properties\":{}},\"__\":\"\"}}}','2017-11-09 05:52:42','2017-11-09 05:52:42');
/*!40000 ALTER TABLE `app_userview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_department`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_department` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  `hod` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEE8AA4418CEBAE1` (`organizationId`),
  KEY `FKEEE8AA44EF6BB2B7` (`parentId`),
  KEY `FKEEE8AA4480DB1449` (`hod`),
  CONSTRAINT `FKEEE8AA4418CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKEEE8AA4480DB1449` FOREIGN KEY (`hod`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FKEEE8AA44EF6BB2B7` FOREIGN KEY (`parentId`) REFERENCES `dir_department` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_department`
--

LOCK TABLES `dir_department` WRITE;
/*!40000 ALTER TABLE `dir_department` DISABLE KEYS */;
INSERT INTO `dir_department` VALUES ('D-001','CEO Office','','ORG-001','4028808127f4ef840127f5efdbfb004f',NULL),('D-002','Human Resource and Admin','','ORG-001','4028808127f4ef840127f5f41d4b0091',NULL),('D-003','Finance','','ORG-001','4028808127f4ef840127f606242400b3',NULL),('D-004','Marketing','','ORG-001','4028808127f4ef840127f5f20f36007a',NULL),('D-005','Product Development','','ORG-001','4028808127f4ef840127f5f04dc2005a',NULL),('D-006','Training and Consulting','','ORG-001','4028808127f4ef840127f5f7c5b500a5',NULL),('D-007','Support and Services','','ORG-001','4028808127fb4d350127ff78d63300d1',NULL);
/*!40000 ALTER TABLE `dir_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_employment`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_employment` (
  `id` varchar(255) NOT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `employeeCode` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `gradeId` varchar(255) DEFAULT NULL,
  `departmentId` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC6620ADE716AE35F` (`departmentId`),
  KEY `FKC6620ADE14CE02E9` (`gradeId`),
  KEY `FKC6620ADECE539211` (`userId`),
  KEY `FKC6620ADE18CEBAE1` (`organizationId`),
  CONSTRAINT `FKC6620ADE14CE02E9` FOREIGN KEY (`gradeId`) REFERENCES `dir_grade` (`id`),
  CONSTRAINT `FKC6620ADE18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKC6620ADE716AE35F` FOREIGN KEY (`departmentId`) REFERENCES `dir_department` (`id`),
  CONSTRAINT `FKC6620ADECE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_employment`
--

LOCK TABLES `dir_employment` WRITE;
/*!40000 ALTER TABLE `dir_employment` DISABLE KEYS */;
INSERT INTO `dir_employment` VALUES ('4028808127f4ef840127f5efdbfb004f','terry',NULL,NULL,NULL,NULL,'G-001','D-001','ORG-001'),('4028808127f4ef840127f5f04dc2005a','clark',NULL,NULL,NULL,NULL,'G-002','D-005','ORG-001'),('4028808127f4ef840127f5f11cf60068','cat',NULL,NULL,NULL,NULL,'G-003','D-005','ORG-001'),('4028808127f4ef840127f5f194e20071','tana',NULL,NULL,NULL,NULL,'G-003','D-005','ORG-001'),('4028808127f4ef840127f5f20f36007a','roy',NULL,NULL,NULL,NULL,'G-002','D-004','ORG-001'),('4028808127f4ef840127f5f319720088','etta',NULL,NULL,NULL,NULL,'G-003','D-004','ORG-001'),('4028808127f4ef840127f5f41d4b0091','sasha',NULL,NULL,NULL,NULL,'G-002','D-002','ORG-001'),('4028808127f4ef840127f5f7c5b500a5','jack',NULL,NULL,NULL,NULL,'G-002','D-006','ORG-001'),('4028808127f4ef840127f606242400b3','tina',NULL,NULL,NULL,NULL,'G-002','D-003','ORG-001'),('4028808127fb4d350127ff78d63300d1','david',NULL,NULL,NULL,NULL,'G-002','D-007','ORG-001'),('4028808127fb4d350127ff84074600f2','julia',NULL,NULL,NULL,NULL,'G-003','D-002','ORG-001');
/*!40000 ALTER TABLE `dir_employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_employment_report_to`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_employment_report_to` (
  `employmentId` varchar(255) NOT NULL,
  `reportToId` varchar(255) NOT NULL,
  `id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employmentId`,`reportToId`),
  KEY `FK53622945F4068416` (`reportToId`),
  KEY `FK536229452787E613` (`employmentId`),
  CONSTRAINT `FK536229452787E613` FOREIGN KEY (`employmentId`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FK53622945F4068416` FOREIGN KEY (`reportToId`) REFERENCES `dir_employment` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_employment_report_to`
--

LOCK TABLES `dir_employment_report_to` WRITE;
/*!40000 ALTER TABLE `dir_employment_report_to` DISABLE KEYS */;
INSERT INTO `dir_employment_report_to` VALUES ('4028808127f4ef840127f5f04dc2005a','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f04e9b005f'),('4028808127f4ef840127f5f20f36007a','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f20fb7007f'),('4028808127f4ef840127f5f41d4b0091','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f48eda009e'),('4028808127f4ef840127f5f7c5b500a5','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f7c60b00aa'),('4028808127f4ef840127f606242400b3','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f60624c100b8'),('4028808127fb4d350127ff78d63300d1','4028808127f4ef840127f5efdbfb004f','4028808127fb4d350127ff78d6fe00d6');
/*!40000 ALTER TABLE `dir_employment_report_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_grade`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_grade` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A49A518CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A49A518CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_grade`
--

LOCK TABLES `dir_grade` WRITE;
/*!40000 ALTER TABLE `dir_grade` DISABLE KEYS */;
INSERT INTO `dir_grade` VALUES ('G-001','Board Members','','ORG-001'),('G-002','Managers','','ORG-001'),('G-003','Executives','','ORG-001');
/*!40000 ALTER TABLE `dir_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_group` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `organizationId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A804D18CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A804D18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_group`
--

LOCK TABLES `dir_group` WRITE;
/*!40000 ALTER TABLE `dir_group` DISABLE KEYS */;
INSERT INTO `dir_group` VALUES ('G-001','Managers','',NULL),('G-002','CxO','',NULL),('G-003','hrAdmin','',NULL);
/*!40000 ALTER TABLE `dir_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_organization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_organization` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55A15FA5961BD498` (`parentId`),
  CONSTRAINT `FK55A15FA5961BD498` FOREIGN KEY (`parentId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_organization`
--

LOCK TABLES `dir_organization` WRITE;
/*!40000 ALTER TABLE `dir_organization` DISABLE KEYS */;
INSERT INTO `dir_organization` VALUES ('ORG-001','Joget.Org','',NULL);
/*!40000 ALTER TABLE `dir_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_role` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_role`
--

LOCK TABLES `dir_role` WRITE;
/*!40000 ALTER TABLE `dir_role` DISABLE KEYS */;
INSERT INTO `dir_role` VALUES ('ROLE_ADMIN','Admin','Administrator'),('ROLE_USER','User','Normal User');
/*!40000 ALTER TABLE `dir_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `timeZone` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user`
--

LOCK TABLES `dir_user` WRITE;
/*!40000 ALTER TABLE `dir_user` DISABLE KEYS */;
INSERT INTO `dir_user` VALUES ('admin','admin','21232f297a57a5a743894a0e4a801fc3','Admin','Admin',NULL,1,'0',NULL),('cat','cat','5f4dcc3b5aa765d61d8327deb882cf99','Cat','Grant','',1,'',NULL),('clark','clark','5f4dcc3b5aa765d61d8327deb882cf99','Clark','Kent','',1,'',NULL),('david','david','5f4dcc3b5aa765d61d8327deb882cf99','David','Cain','',1,'',NULL),('etta','etta','5f4dcc3b5aa765d61d8327deb882cf99','Etta','Candy','',1,'',NULL),('jack','jack','5f4dcc3b5aa765d61d8327deb882cf99','Jack','Drake','',1,'',NULL),('julia','julia','5f4dcc3b5aa765d61d8327deb882cf99','Julia','Kapatelis','',1,'',NULL),('roy','roy','5f4dcc3b5aa765d61d8327deb882cf99','Roy','Harper','',1,'',NULL),('sasha','sasha','5f4dcc3b5aa765d61d8327deb882cf99','Sasha','Bordeaux','',1,'',NULL),('tana','tana','5f4dcc3b5aa765d61d8327deb882cf99','Tana','Moon','',1,'',NULL),('terry','terry','5f4dcc3b5aa765d61d8327deb882cf99','Terry','Berg','',1,'',NULL),('tina','tina','5f4dcc3b5aa765d61d8327deb882cf99','Tina','Magee','',1,'',NULL);
/*!40000 ALTER TABLE `dir_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_extra`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_extra` (
  `username` varchar(255) NOT NULL,
  `algorithm` varchar(255) DEFAULT NULL,
  `loginAttempt` int(11) DEFAULT NULL,
  `failedloginAttempt` int(11) DEFAULT NULL,
  `lastLogedInDate` datetime DEFAULT NULL,
  `lockOutDate` datetime DEFAULT NULL,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `requiredPasswordChange` bit(1) DEFAULT NULL,
  `noPasswordExpiration` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_extra`
--

LOCK TABLES `dir_user_extra` WRITE;
/*!40000 ALTER TABLE `dir_user_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_group` (
  `groupId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `FK2F0367FD159B6639` (`groupId`),
  KEY `FK2F0367FDCE539211` (`userId`),
  CONSTRAINT `FK2F0367FD159B6639` FOREIGN KEY (`groupId`) REFERENCES `dir_group` (`id`),
  CONSTRAINT `FK2F0367FDCE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_group`
--

LOCK TABLES `dir_user_group` WRITE;
/*!40000 ALTER TABLE `dir_user_group` DISABLE KEYS */;
INSERT INTO `dir_user_group` VALUES ('G-001','clark'),('G-001','david'),('G-001','jack'),('G-001','roy'),('G-001','sasha'),('G-001','tina'),('G-002','terry'),('G-003','julia'),('G-003','sasha');
/*!40000 ALTER TABLE `dir_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_meta`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_meta` (
  `username` varchar(255) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`username`,`meta_key`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_meta`
--

LOCK TABLES `dir_user_meta` WRITE;
/*!40000 ALTER TABLE `dir_user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_password_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_password_history` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_password_history`
--

LOCK TABLES `dir_user_password_history` WRITE;
/*!40000 ALTER TABLE `dir_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_replacement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_replacement` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `replacementUser` varchar(255) DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `processIds` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_replacement`
--

LOCK TABLES `dir_user_replacement` WRITE;
/*!40000 ALTER TABLE `dir_user_replacement` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_replacement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_user_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_role` (
  `roleId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK5C5FE738C8FE3CA7` (`roleId`),
  KEY `FK5C5FE738CE539211` (`userId`),
  CONSTRAINT `FK5C5FE738C8FE3CA7` FOREIGN KEY (`roleId`) REFERENCES `dir_role` (`id`),
  CONSTRAINT `FK5C5FE738CE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_user_role`
--

LOCK TABLES `dir_user_role` WRITE;
/*!40000 ALTER TABLE `dir_user_role` DISABLE KEYS */;
INSERT INTO `dir_user_role` VALUES ('ROLE_ADMIN','admin'),('ROLE_USER','cat'),('ROLE_USER','clark'),('ROLE_USER','david'),('ROLE_USER','etta'),('ROLE_USER','jack'),('ROLE_USER','julia'),('ROLE_USER','roy'),('ROLE_USER','sasha'),('ROLE_USER','tana'),('ROLE_USER','terry'),('ROLE_USER','tina');
/*!40000 ALTER TABLE `dir_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectid`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectid` (
  `nextoid` decimal(19,0) NOT NULL,
  PRIMARY KEY (`nextoid`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectid`
--

LOCK TABLES `objectid` WRITE;
/*!40000 ALTER TABLE `objectid` DISABLE KEYS */;
INSERT INTO `objectid` VALUES (1000400);
/*!40000 ALTER TABLE `objectid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_audit_trail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_audit_trail` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `clazz` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `message` text,
  `timestamp` datetime DEFAULT NULL,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_audit_trail`
--

LOCK TABLES `wf_audit_trail` WRITE;
/*!40000 ALTER TABLE `wf_audit_trail` DISABLE KEYS */;
INSERT INTO `wf_audit_trail` VALUES ('ff8080815f9f561e015f9f566c5e0000','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=crm_community, version=1, published=false}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566c680001','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=crm_account, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566c6f0002','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=crm_contact, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566c780003','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=crm_opportunity, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566c840004','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=crm_proposal_approval_form, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566c890005','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=crm_proposal_form, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566c8f0006','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=crm_proposal_resubmit_form, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566c960007','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=crm_proposal_sending_form, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566d870008','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id=crm_account_list, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566d8c0009','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id=crm_contact_list, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566d92000a','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id=crm_opportunity_list, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566d99000b','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id=Proposal, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566da0000c','roleAnonymous','org.joget.apps.app.dao.UserviewDefinitionDaoImpl','add','{id=crm_userview_sales, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566da5000d','roleAnonymous','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id=AppName, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566daa000e','roleAnonymous','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id=refNo, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f566db0000f','roleAnonymous','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id=crm_icon.jpg, appId=crm_community, appVersion=1}','2017-11-09 05:52:42',NULL,NULL),('ff8080815f9f561e015f9f5670170010','roleAnonymous','org.joget.workflow.model.service.WorkflowManagerImpl','processUpload','','2017-11-09 05:52:43','crm_community','1'),('ff8080815f9f561e015f9f5674880011','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5674980012','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5674a70013','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5674b50014','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5674c50015','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5674d30016','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityPlugin','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5674e30017','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityPlugin','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5674f40018','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f5675030019','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f56751d001a','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f567566001b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=crm_community, version=1, published=true}','2017-11-09 05:52:44','crm_community','1'),('ff8080815f9f561e015f9f584ee3001c','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=appcenter, version=1, published=false}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584ee9001d','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id=landing, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f29001e','roleAnonymous','org.joget.apps.app.dao.UserviewDefinitionDaoImpl','add','{id=v, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f2d001f','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=<i class=\'fa fa-home\'></i> Home_zh_CN, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f310020','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=<i class=\'fa fa-home\'></i> Home_zh_TW, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f340021','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=App Center_zh_CN, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f380022','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=App Center_zh_TW, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f3c0023','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Design New App_zh_CN, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f4e0024','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Design New App_zh_TW, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f580025','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Download from Marketplace_zh_CN, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584f970026','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Download from Marketplace_zh_TW, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584fa40027','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Import App_zh_CN, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584fa90028','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Import App_zh_TW, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584fb90029','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Powered by Joget_zh_CN, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584fc1002a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Powered by Joget_zh_TW, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584fcc002b','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Published Apps_zh_CN, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584fd1002c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id=Published Apps_zh_TW, appId=appcenter, appVersion=1}','2017-11-09 13:54:46',NULL,NULL),('ff8080815f9f561e015f9f584fed002d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=appcenter, version=1, published=true}','2017-11-09 13:54:46','appcenter','1');
/*!40000 ALTER TABLE `wf_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_process_link`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_process_link` (
  `processId` varchar(255) NOT NULL,
  `parentProcessId` varchar(255) DEFAULT NULL,
  `originProcessId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_process_link`
--

LOCK TABLES `wf_process_link` WRITE;
/*!40000 ALTER TABLE `wf_process_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report` (
  `activityInstanceId` varchar(255) NOT NULL,
  `processInstanceId` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `dateLimit` bigint(20) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `timeConsumingFromDateCreated` bigint(20) DEFAULT NULL,
  `timeConsumingFromDateStarted` bigint(20) DEFAULT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `packageId` varchar(255) DEFAULT NULL,
  `processDefId` varchar(255) DEFAULT NULL,
  `activityDefId` varchar(255) DEFAULT NULL,
  `assignmentUsers` text,
  `appId` varchar(255) DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activityInstanceId`),
  KEY `FKB943CCA47A4E8F48` (`packageId`),
  KEY `FKB943CCA4A39D6461` (`processDefId`),
  KEY `FKB943CCA4CB863F` (`activityDefId`),
  CONSTRAINT `FKB943CCA47A4E8F48` FOREIGN KEY (`packageId`) REFERENCES `wf_report_package` (`packageId`),
  CONSTRAINT `FKB943CCA4A39D6461` FOREIGN KEY (`processDefId`) REFERENCES `wf_report_process` (`processDefId`),
  CONSTRAINT `FKB943CCA4CB863F` FOREIGN KEY (`activityDefId`) REFERENCES `wf_report_activity` (`activityDefId`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report`
--

LOCK TABLES `wf_report` WRITE;
/*!40000 ALTER TABLE `wf_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report_activity`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_activity` (
  `activityDefId` varchar(255) NOT NULL,
  `activityName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activityDefId`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report_activity`
--

LOCK TABLES `wf_report_activity` WRITE;
/*!40000 ALTER TABLE `wf_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report_package`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_package` (
  `packageId` varchar(255) NOT NULL,
  `packageName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`packageId`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report_package`
--

LOCK TABLES `wf_report_package` WRITE;
/*!40000 ALTER TABLE `wf_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_report_process`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_process` (
  `processDefId` varchar(255) NOT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`processDefId`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_report_process`
--

LOCK TABLES `wf_report_process` WRITE;
/*!40000 ALTER TABLE `wf_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_resource_bundle_message`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_resource_bundle_message` (
  `id` varchar(255) NOT NULL,
  `messageKey` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_resource_bundle_message`
--

LOCK TABLES `wf_resource_bundle_message` WRITE;
/*!40000 ALTER TABLE `wf_resource_bundle_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_resource_bundle_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wf_setup`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_setup` (
  `id` varchar(255) NOT NULL,
  `property` varchar(255) DEFAULT NULL,
  `value` text,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wf_setup`
--

LOCK TABLES `wf_setup` WRITE;
/*!40000 ALTER TABLE `wf_setup` DISABLE KEYS */;
INSERT INTO `wf_setup` VALUES ('ff8080815f9f561e015f9f58500b002e','defaultUserview','appcenter/v',NULL);
/*!40000 ALTER TABLE `wf_setup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 13:55:07
