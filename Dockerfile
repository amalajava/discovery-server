FROM openjdk:8
ADD target/discoveryserver.jar discoveryserver.jar
EXPOSE 8761
ENV JAVA_OPTS=""
ENTRYPOINT ["java", "-jar", "discoveryserver.jar"]