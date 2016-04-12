# flyway-docker

Dockerized [flyway](https://flywaydb.org) command line tool.

## Usage

Run:

```
docker run --rm -v /path/to/your/migrations:/sql -e FLYWAY_CMD=migrate -e DB_USER=postgres -e DB_PASSWORD=postgres -e DB_URL=jdbc:postgresql://db_host/db_name iterators/flyway-docker
```

Remember to provide correct `/path/to/your/migrations` and env variables: `FLYWAY_CMD`, `DB_USER`, `DB_PASSWORD`, `DB_URL`.

## Author & license

If you have any questions regarding this project contact:

Łukasz Sowa <lukasz@iterato.rs> from [Iterators](https://iterato.rs).

For licensing info see LICENSE file in project's root directory.