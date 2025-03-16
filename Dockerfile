# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the target directory
COPY target/maven-webapp-1.0-SNAPSHOT.jar app.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]

# Expose port 8080
EXPOSE 8080
