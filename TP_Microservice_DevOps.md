TP Microservice DevOps



Le TP1 pour la creation du projet et sont deploiement dans docker est un succes, passons a minikubes.


Le deploiement de minikube dans un conteneur docker n'etant pas optimal, il sera deployé sur la machine hote du projet.

Installation de MiniKube : 

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

Verification de la version : 

minikube version
minikube version: v1.38.1
commit: c93a4cb9311efc66b90d33ea03f75f2c4120e9b0


Installation de kubectl pour les commande lines : 

curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install kubectl /usr/local/bin/kubectl
kubectl version --client



Lancer minikube :

minikube start --driver=docker


L'utilisation de minikube a été réalisé en salle de tp, n'ayant pas de materiel suffisamment performant pour minikube.


creation des images docker

docker build -t marchandflorian/catalogue-service:1.0 .
docker build -t marchandflorian/commande-service:1.0 .
docker build -t marchandflorian/config-service:1.0 .
docker build -t marchandflorian/discovery-service:1.0 .
docker build -t marchandflorian/gateway-service:1.0 .
docker build -t marchandflorian/paiement-service:1.0 .

Push les images sur Docker Hub pour que minikube puisse recuperer les images (evite de devoir recreer des images a chaque deploiement de minikube).

docker push marchandflorian/catalogue-service:1.0
docker push marchandflorian/commande-service:1.0
docker push marchandflorian/config-service:1.0
docker push marchandflorian/discovery-service:1.0
docker push marchandflorian/gateway-service:1.0
docker push marchandflorian/paiement-service:1.0

