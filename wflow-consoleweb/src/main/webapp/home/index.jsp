<%@ page import="org.joget.apps.app.service.MobileUtil"%>
<%@ include file="/WEB-INF/jsp/includes/taglibs.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Joget Workflow</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="1; url=../web/desktop">
        <link rel="shortcut icon" href="../images/v3/joget.ico"/>
        <link rel="stylesheet" href="style.css"/>
        <script src="../js/jquery/jquery-1.9.1.min.js"></script>
        <script src="../js/jquery/jquery-migrate-1.2.1.min.js"></script>
        <script src="../mobile/jqm/jquery.cookie.js"></script>
        <c:set var="mobileDisabled" value="<%= MobileUtil.isMobileDisabled() %>"/>
        <c:if test="${!mobileDisabled}">
        <script src="../mobile/mobile.js"></script>
        <script>
            var url = "../web/mobile";
            Mobile.directToMobileSite(url);
        </script>
        </c:if>
        <link href="../js/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    </head>
    <body id="splash">
        <div id="container">
            <div id="logo">
                <img src="logo.png" border="0" height="150" />
            </div>
            <div id="loading">
                <i class="icon-spinner icon-spin icon-2x"></i>
                <br>
                Loading App Center
            </div>
            <div id="footer">
                <a href="http://www.joget.com">&copy; Joget Workflow</a>
            </div>
        </div>
    </body>
</html>
