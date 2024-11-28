#!/bin/bash

MISSING_VARS=()
[ -z "$DB_URL" ] && MISSING_VARS+=("DB_URL")
[ -z "$DB_USER" ] && MISSING_VARS+=("DB_USER")
[ -z "$DB_PASSWORD" ] && MISSING_VARS+=("DB_PASSWORD")

if [ ${#MISSING_VARS[@]} -gt 0 ]; then
    echo "Error: The following required environment variable(s) are not set: ${MISSING_VARS[*]}"
    exit 1
fi

MIGRATION_PATH=${MIGRATION_PATH:-/sql}
SEED_PATH=${SEED_PATH:-/seed}
USE_SEED=${USE_SEED:-false}

if [ "$USE_SEED" = "true" ]; then
    LOCATIONS="filesystem:$MIGRATION_PATH,filesystem:$SEED_PATH"
else
    LOCATIONS="filesystem:$MIGRATION_PATH"
fi


echo "Invoking migrations from path $LOCATIONS"


if [ -z ${DB_CONNECTION_CHECK+x} ];
  then
    echo "DB_CONNECTION_CHECK is not set. Skipping connection test";
  else
    until flyway-10.20.0/flyway validate -url=$DB_URL -user=$DB_USER -password=$DB_PASSWORD;
      do
        echo "DB is unavailable - sleeping";
        sleep 1
      done
      echo "DB is up and running";

fi



flyway-10.20.0/flyway ${FLYWAY_CMD:-migrate} -url=$DB_URL -user=$DB_USER -password=$DB_PASSWORD -locations=$LOCATIONS
