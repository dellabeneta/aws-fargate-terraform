#!/bin/bash

echo "Criando variável com nome da Imagem"
sleep 3
image_name="dellabeneta/doguinho:latest"

echo "Construindo a ImagemAutenticando na conta do DockerHub"
sleep 3
docker build -t $image_name .

echo "Autenticando na conta do DockerHub"
sleep 3
docker login -u dellabeneta -p dockerdella

echo "Enviando a Imagem para o DockerHub"
sleep 3
docker push $image_name

echo "Efetuando o Logout do DockerHub"
sleep 3
docker logout

echo "Imagem $image_name construída e enviada com SUCESSO!"
sleep 3