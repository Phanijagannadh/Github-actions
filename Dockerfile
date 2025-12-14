##artifact build stage
FROM maven AS buildstage
RUN mkdir /maven_files
COPY . /maven_files/
RUN mvn -f /maven_files/pom.xml clean install

### tomcat deploy stage
FROM tomcat
WORKDIR /usr/local/tomcat/webapps
COPY --from=buildstage /maven_files/target/*.war .  
EXPOSE 8080  
