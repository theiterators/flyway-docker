FROM azul/zulu-openjdk:17-jre-latest

ADD https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64 /bin/curl
RUN chmod 755 /bin/curl
RUN curl -OLs https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/9.20.1/flyway-commandline-9.20.1-linux-x64.tar.gz
RUN tar -xzf flyway-commandline-9.20.1-linux-x64.tar.gz
RUN rm flyway-commandline-9.20.1-linux-x64.tar.gz
RUN chmod 755 flyway-9.20.1/flyway

VOLUME /sql

ADD cmd.sh /
RUN chmod +x ./cmd.sh
CMD ["bash", "-c", "./cmd.sh"]
