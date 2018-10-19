#!/bin/bash


echo "PassPhrase A : "
read -rs userA
echo "PassPhrase B : "
read -rs userB

echo $userA
echo $userB
salt=$(echo $userA | openssl enc -aes-256-cbc -pass pass:$userB -P | grep salt | cut -d"=" -f 2)
echo $salt >salty

key=$(echo $userA | openssl aes-256-cbc -pass pass:$userB -S $salt -base64)
echo $key
file="Jean test | 1234 5678 9012 3456"

#Je save le salt dans un fichier pour l'utiliser pendant le dechiffrage
echo $file | openssl enc -aes-256-cbc -pass pass:$key -out file.crypt -base64
