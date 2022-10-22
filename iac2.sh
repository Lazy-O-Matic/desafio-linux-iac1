#!/bin/bash

echo "Atualizando o servidor"
apt update && apt dist-upgrade -y

echo "Instalando apache2, unzip e wget"
apt install -y apache2 unzip wget

echo "Baixando a aplicação"
cd /tmp && wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Extraindo os arquivos "
unzip main.zip

echo "Copiando os arquivos"
cp -R linux-site-dio-main/* /var/www/html/

echo "Iniciando o apache (caso esteja parado)"
service apache2 start
