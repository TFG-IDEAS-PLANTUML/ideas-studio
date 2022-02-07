FROM tomcat:9.0.16-jre8

# ENV CATALINA_OPTS="-XX:PermSize=256m -XX:MaxPermSize=768m -server -Xms256m -Xmx1g -XX:SurvivorRatio=6 -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=68 -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+HeapDumpOnOutOfMemoryError"

# Create keystore
RUN /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/keytool -genkey -alias tomcat -keyalg RSA -storepass changeit -dname "cn=Mark Jones, ou=JavaSoft, o=Sun, c=US" -keypass changeit -keystore /usr/local/tomcat/.keystore

# Add start script X
ADD ./tomcat-config/start.sh ./

# Add war to webapps
ADD target/ROOT*.war ./webapps/ROOT.war

# Make ideas-repo directory
RUN mkdir /usr/local/tomcat/ideas-repo

RUN mv  ./webapps/ROOT ./webapps/managerui

EXPOSE 80 443

CMD  ./bin/catalina.sh run & sleep 40s && bash ./start.sh
