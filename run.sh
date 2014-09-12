#docker.io run -d --name wordpress -p 127.0.1.1:8080:80 tutum/wordpress

docker stop wordpress     ; docker rm wordpress
docker stop wordpressmysql; docker rm wordpressmysql

#docker run -d --name wordpress -v $PWD/data/:/var/lib/mysql -e MYSQL_PASS="mypass" -p 127.0.1.1:8080:80 -p 127.0.1.1:3306:3306 tutum/wordpress

PASSWD=mylongandsecretpassword

SRC=$HOME/data/docker
SRC_SQL=$SRC/wordpress

docker run --name wordpressmysql -e MYSQL_ROOT_PASSWORD=$PASSWD -v $SRC_SQL:/var/lib/mysql -p 127.0.1.1:3307:3306 -d mysql

sleep 10

docker run --name wordpress --link wordpressmysql:mysql -e MYSQL_ROOT_PASSWORD=$PASSWD -p 127.0.1.1:8088:80 -d wordpress

#watch docker logs wordpress
