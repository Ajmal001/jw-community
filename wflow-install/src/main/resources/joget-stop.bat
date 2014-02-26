@ECHO OFF

REM Stop MySQL
ECHO == Stopping MySQL ==
ECHO.
CALL .\mysql-stop.bat
ECHO.

REM Stop Tomcat
set JAVA_HOME=.\jre1.7.0_51
set CATALINA_HOME=.\apache-tomcat-7.0.52
ECHO == Stopping Tomcat from %CATALINA_HOME% ==
ECHO.
%CATALINA_HOME%\bin\shutdown.bat

ECHO.
ECHO Shutdown initiated. Please close the Tomcat console window to complete shutdown.
PAUSE
