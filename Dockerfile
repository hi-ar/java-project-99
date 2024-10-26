FROM gradle:8.10.2-jdk21

WORKDIR /app

COPY ./ .

RUN gradle -version

RUN java -version

RUN echo $JAVA_HOME

RUN ./gradlew :server:installDist

CMD build/install/app/bin/app