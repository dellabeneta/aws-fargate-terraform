#!/bin/bash

echo "Criando variável com nome da Imagem"
sleep 3
local_image="dellabeneta/doguinho:latest"
remote_image="220313512128.dkr.ecr.us-west-1.amazonaws.com/doguinho:latest"
ecr_repo="220313512128.dkr.ecr.us-west-1.amazonaws.com"

echo "Autenticando no AWS ECR"
sleep 3
aws ecr get-login-password --region us-west-1 --profile doguinho| docker login --username AWS --password-stdin $ecr_repo

echo "Alterando a Tag da Imagem local para envio ao AWS ECR"
sleep 3
docker tag $local_image $remote_image

echo "Enviando a Imagem com a Tag ajustada para o ECR"
sleep 3
docker push $remote_image

echo "Imagem Docker enviada com Sucesso para o ECR!"
sleep 3