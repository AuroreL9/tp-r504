#!/bin/bash

echo "Création du réseau Docker interne"
docker network create tplb 2>/dev/null

echo "Suppression des anciens conteneurs"
docker rm -f nginx1 nginx2 nginx-lb 2>/dev/null

echo "Construction de l'image im-nginx-lb"
docker build -t im-nginx-lb ./tp-A

echo "Création des dossiers shared1 et shared2"
mkdir -p shared1 shared2

echo "Création des fichiers index.html"
echo "Hello 1" > shared1/index.html
echo "Hello 2" > shared2/index.html

echo "Lancement des conteneurs nginx1 et nginx2"
docker run -d --rm \
    --name nginx1 \
    -p 81:80 \
    --network tplb \
    -v "$(pwd)/shared1:/usr/share/nginx/html" \
    nginx

docker run -d --rm \
    --name nginx2 \
    -p 82:80 \
    --network tplb \
    -v "$(pwd)/shared2:/usr/share/nginx/html" \
    nginx

echo "Lancement du conteneur load-balancer"
docker run -d --rm \
    --name nginx-lb \
    -p 83:80 \
    --network tplb \
    im-nginx-lb

echo "=== Tout est lancé avec succès ==="
