#!/bin/bash

# Importer la clé GPG publique du dépôt :

rpm --import https://download.docker.com/linux/rhel/gpg

# Créer le fichier /etc/yum.repos.d/docker-ce.repo et l’éditer comme ceci :

[docker]
name=Docker
baseurl=https://download.docker.com/linux/rhel/$releasever/$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/rhel/gpg

# Installer Docker :

dnf install -y docker-ce

# L’installation du paquet a créé un groupe système docker :

grep docker /etc/group

# En temps normal, la commande docker doit être invoquée en tant que root. Pour éviter cela, on pourra ajouter l’utilisateur au groupe système correspondant :

usermod -aG docker <votre_identifiant>

# Démarrer le service Docker et activer son lancement au démarrage :

systemctl enable docker --now

# Si tout s’est bien passé, la commande docker version invoquée en tant que simple utilisateur affiche les versions respectives du client et du serveur :

docker version
