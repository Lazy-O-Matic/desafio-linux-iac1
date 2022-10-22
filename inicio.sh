#!/bin/bash

echo "Criando diretórios"
mkdir /publico /adm /ven /sec

echo "Atribuindo permissões dos diretórios"
chmod 777 /publico
chmod 770 /adm /ven /sec

echo "Criando grupos"
for i in GRP_ADM GRP_VEN GRP_SEC; do
   groupadd $i
done

echo "Atribuindo os grupos aos diretórios"
chgrp GRP_ADM /adm
chgrp GRP_VEN /ven
chgrp GRP_SEC /sec


echo "Criando usuários do grupo adm"
for i in carlos maria joao; do
   useradd -m -s /bin/bash -p `openssl passwd mudar123` -G GRP_ADM $i
   passwd $i -e >/dev/null
done

echo "Criando usuários do grupo ven"
for i in debora sebastiana roberto; do
   useradd -m -s /bin/bash -p `openssl passwd mudar123` -G GRP_VEN $i
   passwd $i -e >/dev/null
done

echo "Criando usuários do grupo sec"
for i in josefina amanda rogerio; do
   useradd -m -s /bin/bash -p `openssl passwd mudar123` -G GRP_SEC $i
   passwd $i -e >/dev/null
done
