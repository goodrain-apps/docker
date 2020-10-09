#!/bin/bash
# exec at path of Dockerfile
#docker run -ti -v $(pwd)/changelog:/liquibase/changelog -e MYSQL_HOST=<somewhere> -e MYSQL_PORT=<someport> -e MYSQL_USER=<myuser> -e MYSQL_PASSWORD=<Whoknows> --name=liqui --rm liquibase:gx bash


docker run -ti -v $(pwd)/changelog:/liquibase/changelog -e MYSQL_HOST=106.15.152.33 -e MYSQL_PORT=10080 -e MYSQL_USER=admin -e MYSQL_PASSWORD=e3f2a081 --name=liqui --rm liquibase:gx debug