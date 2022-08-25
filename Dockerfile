# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS maven
WORKDIR /usr/src/app
COPY . /usr/src/app

# This is needed due to some git build hook maven plugin
RUN git init

# Compile and package the application to an executable JAR
RUN mvn package --no-transfer-progress

#Distrubution debian
FROM     openjdk:11.0-jre
#ajouter dos2unix to format script files created in winodows with unix ending
RUN      apt-get update && apt-get install dos2unix
RUN      mkdir  /usr/local/starter-backend
RUN      mkdir  /usr/local/starter-backend/log
COPY     start.sh  /usr/local/bin/
COPY     --from=maven /usr/src/app/target/*.jar  /usr/local/starter-backend/app.jar
RUN      dos2unix /usr/local/bin/start.sh
RUN      chmod +x  /usr/local/bin/start.sh
WORKDIR  /usr/local/starter-backend/

VOLUME /usr/local/starter-backend/log

EXPOSE 80
CMD ["start.sh"]
