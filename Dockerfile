FROM openjdk:8
ADD target/mavenproject4docker.jar mavenproject4docker.jar
ENTRYPOINT ["java", "-jar","mavenproject4docker.jar"]
EXPOSE 8080