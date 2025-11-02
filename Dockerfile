FROM eclipse-temurin:17-jre-alpine

EXPOSE 8080

WORKDIR /usr/app

COPY target/*.jar maven-test.jar

ENTRYPOINT ["java", "-jar", "maven-test.jar"]
