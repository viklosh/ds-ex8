FROM maven:3.6.3-jdk-8-slim as maven_builder

COPY ./boxfuse-sample-java-war-hello /app

WORKDIR /app

RUN ["mvn", "package"]

######################################################################################

FROM tomcat:10.0.2-jdk8-corretto

COPY --from=maven_builder /app/target/hello-1.0.war /usr/local/tomcat/webapps