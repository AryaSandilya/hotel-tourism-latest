FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy jar from build
COPY build/libs/tourism-app-*.jar /app/

ENTRYPOINT ["java", "-jar", "/app/tourism-app-0.0.1-SNAPSHOT.jar"]


