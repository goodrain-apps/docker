#!/bin/bash
# exec at path of Dockerfile
#docker run -ti -v $(pwd)/changelog:/liquibase/changelog -e MYSQL_HOST=<somewhere> -e MYSQL_PORT=<someport> -e MYSQL_USER=<myuser> -e MYSQL_PASSWORD=<Whoknows> --name=liqui --rm liquibase:gx bash


docker run -ti -v $(pwd)/changelog:/liquibase/changelog --name=liqui --rm liquibase:gx bash