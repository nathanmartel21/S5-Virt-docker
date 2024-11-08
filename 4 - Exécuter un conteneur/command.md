# 4 - Exécuter un conteneur

> Source : [https://blog.microlinux.fr/formation-docker-04-executer/](https://blog.microlinux.fr/formation-docker-04-executer/)

```bash
docker run -dit --name web debian #donne un nom du conteneur
docker ps -l #donne le dernier conteneur qui a été lancé
docker run -dit --restart always --name conteneur_quatre debian #pour restart le conteneur automatiquement (après un redémarrage du PC, d’une panne, etc.)
docker kill [NAME] #si problème avec docker stop, on force avec kill
docker kill [NAME] #si problème avec docker stop, on force avec kill
  docker logs -t [NAME] #affiche l’horodatage
  docker logs -f [NAME] #affiche en temps réel la sortie logs (same as tail -f)
  dockerlogs -ft [NAME] #combine les deux
```

## Exercice : 

```bash
docker run -dit redis
docker run -dit redis
docker run hello-world
docker run -dit hello-world
docker logs quirky_moore #le 2024-11-05 à 9h04 et 47 secondes
```

**Notes externes :** 
- Si je lance un conteneur avec un nom déjà existant, le conteneur ne se lancera pas
- Si je remove un conteneur avec un nom ambigu (e.g. 2 mêmes SHORT ID), message d'erreur, aucun conteneur n'est supprimé
