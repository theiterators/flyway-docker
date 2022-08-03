FROM eclipse-temurin:11-jre-alpine

RUN apk add --update curl bash
RUN curl -OL https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/9.0.4/flyway-commandline-9.0.4-linux-x64.tar.gz
RUN tar -xzf flyway-commandline-9.0.4-linux-x64.tar.gz
RUN rm flyway-commandline-9.0.4-linux-x64.tar.gz
RUN rm flyway-9.0.4/jre -rf
RUN chmod +x flyway-9.0.4/flyway

VOLUME /sql

ADD cmd.sh /
RUN chmod +x ./cmd.sh
CMD ["bash", "-c", "./cmd.sh"]
