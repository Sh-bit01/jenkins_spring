FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY target/app.jar /app/
<<<<<<< HEAD

=======
>>>>>>> 360c0dd7e0b76d26cef0029ccbf3c14ebf9c1943
EXPOSE 8888

CMD ["java", "-jar", "/app/app.jar"]
