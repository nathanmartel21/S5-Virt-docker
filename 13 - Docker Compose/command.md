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







