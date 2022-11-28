FROM openjdk:11-jre-slim as prod
EXPOSE 8081

WORKDIR /run

CMD [mvn compile]

COPY **/*.jar petclinic.jar

CMD java -jar petclinic.jar
