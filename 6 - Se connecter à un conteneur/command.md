# 6 - Se connecter à un conteneur

> Source : https://blog.microlinux.fr/formation-docker-06-connexion/

## Commandes : 

```bash
docker run -it --name apache httpd /bin/bash #permet de lancer le conteneur et de s’y mettre dedans (théoriquement ! cf Exercice 3, 2 - Les commandes de base
```

Pour sortir d’un conteneur : Ctrl + D ou exit

```bash
docker run -dit --name shelltest httpd && docker exec -it shelltest /bin/bash
docker exec -d execution touch /root/coucou.txt #créer un fichier coucou.txt dans le conteneur. Théoriquement, pas obligé de mettre le -d (même si plus propre)
docker exec -it execution ls /root
```

## Exercice : 

```bash
docker run --name shell_redis -ti redis /bin/bash
bash --version
docker rm shell_redis
docker run -d --name shell_redis redis
docker exec -it shell_redis /bin/bash
bash --version
docker exec -it shell_redis bash
docker exec -it shell_redis sh
```


