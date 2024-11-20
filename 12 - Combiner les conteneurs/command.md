# 12 - Combiner les conteneurs

> Source : [https://blog.microlinux.fr/formation-docker-12-combiner/](https://blog.microlinux.fr/formation-docker-12-combiner/)

## Commandes : 

Conteneur MariadB : 

```
docker run -d --name mariadb -h mariadb --network blog-wordpress -e MYSQL_RANDOM_ROOT_PASSWORD=1 -e MYSQL_DATABASE=wp -e MYSQL_USER=wpuser -e MYSQL_PASSWORD=motdepasse -v blog-db-volume:/var/lib/mysql mariadb
```

Conteneur PHPMyAdmin : 

```
docker run -d --name phpmyadmin -h phpmyadmin --network blog-wordpress -p 8080:80 -e PMA_HOST=mariadb phpmyadmin/phpmyadmin #-h = --hostname
```

Conteneur WordPress

```
docker run -d --name wordpress -h wordpress --network blog-wordpress -v blog-wp-volume:/var/www/html/wp-content -p 80:80 -e WORDPRESS_DB_HOST=mariadb -e WORDPRESS_DB_USER=wpuser -e WORDPRESS_DB_NAME=wp -e WORDPRESS_DB_PASSWORD=motdepasse wordpress
```

## Exercice : 

```
docker network create blognet
docker volume create dbvol

docker run -d --name db --network blognet -e MYSQL_RANDOM_ROOT_PASSWORD=root -e MYSQL_DATABASE=blog -e MYSQL_USER=bloguser -e MYSQL_PASSWORD=pass123 -v dbvol:/var/lib/mysql mariadb

docker run -d --name dbadmin -h dbadmin --network blognet -p 9090:80 -e PMA_HOST=db phpmyadmin/phpmyadmin

docker run -d --name web -h web --network blognet -v webvol:/var/www/html/wp-content -p 9000:80 -e WORDPRESS_DB_HOST=db -e WORDPRESS_DB_USER=bloguser -e WORDPRESS_DB_NAME=blog -e WORDPRESS_DB_PASSWORD=pass123 wordpress
```
