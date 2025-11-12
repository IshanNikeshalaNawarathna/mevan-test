FROM eclipse-temurin:17-jre-alpine

EXPOSE 8080

WORKDIR /usr/app

COPY target/test-*.jar .

##ENTRYPOINT ["java", "-jar", "maven-test.jar"]

CMD java -jar test-*.jar
