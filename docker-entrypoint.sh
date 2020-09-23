#!/bin/bash
[[ $DEBUG ]] && set -x

# 
# if [ "${1#-}" != "$1" ]; then
# 	set -- /liquibase/liquibase "$@"
# fi

# exec "$@"



# if [[ "$1" == "debug" ]];then
#     /bin/bash
# # first arg is `-*` (picks up `--*`, too)
# elif [[ "${1#-}" != "$1" ]]; then
#     #https://unix.stackexchange.com/questions/308260/what-does-set-do-in-this-dockerfile-entrypoint
# 	set -- /liquibase/liquibase "$@"
# else 
#     exec $@
# fi



sleep infinity

exec $@