#/bin/sh

export JAVA_OPTS="-XX:MaxPermSize=128m -Xmx512M -Dwflow.home=./wflow/ "

apache-tomcat-8.5.8/bin/catalina.sh $*
 

