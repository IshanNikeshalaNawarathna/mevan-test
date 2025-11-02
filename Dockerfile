FROM eclipse-temurin:17-jre-alpine

EXPOSE 8080

COPY ./build/libs/test-0.0.1-*.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "test-0.0.1-SNAPSHOT.jar"]
