# Utiliser une image de base avec Docker et Kubernetes
FROM ubuntu:20.04

# Installation des dépendances nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    sudo \
    docker.io \
    bash

# Installer Minikube
RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
    chmod +x minikube-linux-amd64 && \
    mv minikube-linux-amd64 /usr/local/bin/minikube

# Télécharger kubectl
RUN curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl

# Ajouter un script d'initialisation de Minikube
CMD ["minikube", "start", "--driver=docker"]