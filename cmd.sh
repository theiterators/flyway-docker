if [ -z ${DB_CONNECTION_CHECK+x} ];
  then 
    echo "DB_CONNECTION_CHECK is not set. Skipping connection test";
  else
    until flyway-9.0.4/flyway info -url=$DB_URL -user=$DB_USER -password=$DB_PASSWORD;
      do
        echo "DB is unavailable - sleeping";
        sleep 1
      done 
      echo "DB is up and running";

fi

flyway-9.0.4/flyway $FLYWAY_CMD -url=$DB_URL -user=$DB_USER -password=$DB_PASSWORD -locations=filesystem:/sql
