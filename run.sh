MY_PATH="`dirname \"$0\"`"

source $MY_PATH/cfg

docker stop wordpress     #; docker rm wordpress
#docker stop wordpressmysql; docker rm wordpressmysql

#docker run -d --name wordpress -v $PWD/data/:/var/lib/mysql -e MYSQL_PASS="mypass" -p 127.0.1.1:8080:80 -p 127.0.1.1:3306:3306 tutum/wordpress

#docker run --name wordpressmysql -e MYSQL_ROOT_PASSWORD=$PASSWD -v $SRC_SQL:/var/lib/mysql -p 127.0.1.1:3307:3306 -d mysql

#sleep 10

#docker run --name wordpress --link wordpressmysql:mysql -e MYSQL_ROOT_PASSWORD=$PASSWD -p 127.0.1.1:8088:80 -d wordpress

docker run --name wordpress -v $SRC_SQL:/var/lib/mysql -v $SRC_APP:/app -e MYSQL_PASS=$PASSWD -p 127.0.1.1:8088:80 -d tutum/wordpress

#-v $SRC_CONTENT:/app/wp-content -v $SRC_ADMIN:/app/wp-admin -v $SRC_CONF:/app/wp-config.php

#/app/wp-content/uploads
#watch docker logs wordpress
