#!/bin/bash

#Debug Mode

[[ $DEBUG ]] && set -x

# Create database url frm environment variables

Database_url(){
	#Detect mysql from service depend
	if [ ! -n "${DEPEND_SERVICE}" ]; then
      echo "===================================================================================="
      echo 'There is no mysql server on my back, make sure you have define correct ${MYSQL_HOST}'
      echo "===================================================================================="
    else    
	  while :
	    do 
          mysql_host=$(nslookup ${DEPEND_SERVICE%:*} | grep Address | sed '1d' | awk '{print $2}')
          if [ -n "${mysql_host}" ];then
		    export MYSQL_HOST=$(echo $mysql_host)
		    break
		  fi
		done
    fi
	sed -i -r -e "s#__CHANGELOG_PATH__#${CHANGELOG_PATH:-'changelog/changelog.mysql.sql'}#" \
              -e "s#__MYSQL_HOST__#${MYSQL_HOST:-127.0.0.1}#" \
              -e "s#__MYSQL_PORT__#${MYSQL_PORT:-3306}#" \
              -e "s#__MYSQL_DATABASE__#${MYSQL_DATABASE:-Initialize}#" \
			  -e "s#__MYSQL_USER__#${MYSQL_USER:-admin}#" \
			  -e "s#__MYSQL_PASSWORD__#${MYSQL_PASSWORD}#" /liquibase/liquibase.properties
}



# Check whether Mysql is Online

Check_mysql(){ 
  while :
    do
      echo "===================================================================================="
      echo "Detecting whether Mysql is started···"
	  echo "===================================================================================="
      Database_url
	  liquibase history 
      if [ $? == 0 ];then
	    echo "===================================================================================="
	    echo "Get ready to start the UPDATE process···"
	    echo "===================================================================================="
	    break
	  else
	    echo "===================================================================================="
	    echo "Mysql hasn't started yet!  Redetect after 3 seconds"
	    echo "===================================================================================="
	    sleep 3
	  fi
    done
}

# Update mysql schema

Schema_update(){
	echo "===================================================================================="
    echo "Start the UPDATE process,focus on log output!"
	echo "===================================================================================="
	liquibase update
	if [ $? == 0 ];then
	  echo "===================================================================================="
      echo "The update is successful,congratulations"
	  echo "===================================================================================="
	else
	  echo "===================================================================================="
      echo "The update is failed,focus on log output!"
	  echo "===================================================================================="
	  exit 1
	fi
}

#========================== Main =============================

if [[ "$1" == "debug" ]];then
    /bin/bash   
else
    Check_mysql
    Schema_update
fi
