FROM anapsix/alpine-java

RUN apk add --update curl
RUN curl -OL https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0/flyway-commandline-4.0-linux-x64.tar.gz
RUN tar -xzf flyway-commandline-4.0-linux-x64.tar.gz
RUN rm flyway-commandline-4.0-linux-x64.tar.gz
RUN chmod +x flyway-4.0/flyway

VOLUME /sql

ADD cmd.sh /
RUN chmod +x ./cmd.sh
CMD ["bash", "-c", "./cmd.sh"]