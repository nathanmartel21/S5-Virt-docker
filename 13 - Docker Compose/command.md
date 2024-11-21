# 13 - Docker Compose

> Source : [https://blog.microlinux.fr/formation-docker-13-compose/](https://blog.microlinux.fr/formation-docker-13-compose/)

## Commandes : 

Fichier docker-compose.yaml : 

```
---  # compose.yaml
services:
  # MariaDB
  mariadb:
    image: mariadb:latest
    volumes:
      - blog-db-volume:/var/lib/mysql
    environment:
      MYSQL_RANDOM_ROOT_PASSWORD: 1
      MYSQL_DATABASE: wp
      MYSQL_USER: wpuser
      MYSQL_PASSWORD: motdepasse
    restart: always
  # PHPMyAdmin
  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    environment:
      PMA_HOST: mariadb
    ports:
      - "8080:80"
    restart: always
  # WordPress
  wordpress:
    image: wordpress:latest
    volumes:
      - blog-wp-volume:/var/www/html/wp-content
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: mariadb
      WORDPRESS_DB_USER: wpuser
      WORDPRESS_DB_NAME: wp
      WORDPRESS_DB_PASSWORD: motdepasse
    restart: always
volumes:
  blog-db-volume:
  blog-wp-volume:
```

## Exercice : 

```
mkdir -v wordpress-exercice && cd wordpress-exercice
```
```
#Fichier docker-compose.yaml

networks:
  blognet: # Définit le réseau personnalisé
    driver: bridge

volumes:
  dbvol:
  webvol:

services:
  db:
    image: mariadb:latest
    container_name: db
    networks:
      - blognet
    volumes:
      - dbvol:/var/lib/mysql
    environment:
      MYSQL_RANDOM_ROOT_PASSWORD: "root"
      MYSQL_DATABASE: "blog"
      MYSQL_USER: "bloguser"
      MYSQL_PASSWORD: "pass123"
    restart: always

  dbadmin:
    image: phpmyadmin/phpmyadmin:latest
    container_name: dbadmin
    hostname: dbadmin
    networks:
      - blognet
    ports:
      - "9090:80"
    environment:
      PMA_HOST: db
    restart: always

  web:
    image: wordpress:latest
    container_name: web
    hostname: web
    networks:
      - blognet
    ports:
      - "9000:80"
    volumes:
      - webvol:/var/www/html/wp-content
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: bloguser
      WORDPRESS_DB_NAME: blog
      WORDPRESS_DB_PASSWORD: pass123
    restart: always
```

```
docker compose -f docker-compose.yaml up -d
firefox http://localhost:9000
docker ps --format "table {{.Names}}" # --> db, web et dbadmin
docker network ls # --> wordpress-exercice_blognet
docker volume ls # --> wordpress-exercice_dbvol et wordpress-exercice_webvol

docker compose -f docker-compose.yaml down
```
