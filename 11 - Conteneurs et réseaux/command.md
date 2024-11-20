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











