FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY target/app.jar /app/
EXPOSE 8888

CMD ["java", "-jar", "/app/app.jar"]
