#FROM eclipse-temurin:21-jdk
#
#ARG GRADLE_VERSION=8.10.2
#
#RUN apt-get update && apt-get install -yq make unzip
#
#RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
#    && unzip gradle-${GRADLE_VERSION}-bin.zip \
#    && rm gradle-${GRADLE_VERSION}-bin.zip
#
##ENV GRADLE_HOME=/opt/gradle
#
#RUN mv gradle-${GRADLE_VERSION} ${GRADLE_HOME}
#
#ENV PATH=$PATH:$GRADLE_HOME/bin
#
#WORKDIR /app
#
#COPY ./ .
#
#RUN gradle installDist
#
#CMD build/install/app/bin/app


FROM eclipse-temurin:21-jdk

RUN apt-get update && apt-get install -yq make unzip

WORKDIR /backend

COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY gradlew .

RUN ./gradlew --no-daemon dependencies

#COPY lombok.config .
COPY src src

#COPY --from=frontend /frontend/dist /backend/src/main/resources/static

RUN ./gradlew --no-daemon build

ENV JAVA_OPTS "-Xmx512M -Xms512M"
EXPOSE 8080

CMD java -jar build/libs/app-0.0.1-SNAPSHOT.jar