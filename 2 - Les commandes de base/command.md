- Image officielle de CentOS : `centos`
- Image officielle d’Alma Linux : `almalinux`

# Lancer un conteneur CentOS

```bash
docker run -dit centos
```

# Lancer un conteneur AlmaLinux

```bash
docker run -dit almalinux
```

# Arrêter un conteneur spécifique par ID, nom ou ID abrégé :

```bash
docker stop [ID] | [NAME] | [SHORT_ID]
```

# Inspecter un conteneur spécifique par ID, nom ou ID abrégé :

```bash
docker inspect [ID] | [NAME] | [SHORT_ID]
```

# Arrêter tous les conteneurs en cours d'exécution :

```bash
docker stop $(docker ps -aq)
```
