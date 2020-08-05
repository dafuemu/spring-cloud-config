FROM adoptopenjdk/openjdk11:alpine
EXPOSE 8080
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=target/spring-cloud-config-1.0.0
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.earthtech.appt.springcloudconfig.SpringCloudConfigApplication"]
