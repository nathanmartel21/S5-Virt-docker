# 11 - Conteneurs et réseaux

> Source : [https://blog.microlinux.fr/formation-docker-11-reseaux/](https://blog.microlinux.fr/formation-docker-11-reseaux/)

## Commandes : 

Affichez la chaîne personnalisée DOCKER avec iptables :

```
sudo iptables -nL "DOCKER"
```

Le conteneur partage le réseau de l'hôte

```
docker run -dit --network host php:apache
```

Réseaux utilisés par docker : 

```
docker network ls #réseau bridge : par défaut
```

Créer un réseau docker : 

```
docker network create blog #il sera de type bridge
```

Lancement conteneur mariadb : 

```
docker run -dit --name database --network blog -e MYSQL_ROOT_PASSWORD=password123 -e MYSQL_DATABASE=wordpress --mount src=blog_db_data,dst=/var/lib/mysql mariadb
```

On peut aussi faire ça : 

```
cd /var/lib/docker/volumes/blog_web_data/_data
wget -c https://wordpress.org/wordpress-latest.tar.gz
tar -xzf wordpress-latest.tar.gz
rm -f wordpress-latest.tar.gz

docker exec -it web bash
chown -R www-data:www-data wordpress/
```

## Exercice 1 : 

Dockerfile : 

```
FROM php:8.1-apache
RUN apt update && docker-php-ext-install mysqli
EXPOSE 80
```
```
docker build -t nathanmartel21/php:mysqli .

docker login -u nathanmartel21
docker push nathanmartel21/php:mysqli

docker run -dit --name web_php --network blog --mount src=blog_web_data,dst=/var/www/html nathanmartel21/php:mysqli #je me sers de l'ancien volume où il y a le wordpresss

docker system prune
```

## Exercice 2 :

```
docker network create drupal
docker volume create db

docker pull postgres:15.3

docker run -d --name db --network drupal -e POSTGRES_USER=drupal -e POSTGRES_PASSWORD=password123 -e POSTGRES_DB=drupal -v db:/var/lib/postgresql/data postgres:15.3

docker network inspect drupal
```

![IMAGE 1](./capture/1.png")

```
docker pull drupal:7.98
docker run -d --name drupal --network drupal -p 80:80 drupal:7.98
```

![IMAGE 2](./capture/2.png")

![IMAGE 3](./capture/3.png")
