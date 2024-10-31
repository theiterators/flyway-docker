FROM azul/zulu-openjdk:17-jre-latest

ADD https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64 /bin/curl
RUN chmod 755 /bin/curl
RUN curl -OLs https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/10.20.0/flyway-commandline-10.20.0-linux-x64.tar.gz
RUN tar -xzf flyway-commandline-10.20.0-linux-x64.tar.gz
RUN rm flyway-commandline-10.20.0-linux-x64.tar.gz
RUN chmod 755 flyway-10.20.0/flyway

VOLUME /sql

ADD cmd.sh /
RUN chmod +x ./cmd.sh
CMD ["bash", "-c", "./cmd.sh"]
