FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy jar from build
COPY build/libs/tourism-app-*.jar app.jar

# Expose application port
EXPOSE 8082

# Run application
ENTRYPOINT ["java","-jar","app.jar"]