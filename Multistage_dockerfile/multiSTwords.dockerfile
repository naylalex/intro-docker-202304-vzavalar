FROM maven:3.8.6-openjdk-8-slim as builder
WORKDIR /usr/src/app 
COPY ./src  ./src
COPY pom.xml .
RUN mvn verify

FROM  amazoncorretto
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ .
CMD ["java","-Xmx8m","-Xms8m","-jar","target/words.jar"]
EXPOSE 8080
