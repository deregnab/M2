#!/bin/bash


echo "PassPhrase A : "
read userA
echo "PassPhrase B : "
read userB

echo $userA
echo $userB

key=$(echo $userA | openssl enc -aes-256-cbc -pass pass:$userB  -base64)
echo $key
file="Jean test | 1234 5678 9012 3456"
#Je save le salt dans un fichier pour l'utiliser pendant le dechiffrage
echo $file | openssl enc -aes-256-cbc -pass pass:$key -out file.crypt -base64
