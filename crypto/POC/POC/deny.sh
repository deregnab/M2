#! /bin/bash

#on récupère les infos de personneA et personneB
echo "A entrez votre identifiant :"
read nomA
echo -ne "$nomA entrez votre password:"
read -rs passA
echo ""

echo "B entrez votre identifiant :"
read nomB
echo -ne "$nomB entrez votre password:"
read -rs passB
echo ""

#charge les USB en var
A=$(openssl enc -aes-256-cbc -d -pass pass:$passA -base64 -in usbA/$nomA)
B=$(openssl enc -aes-256-cbc -d -pass pass:$passB -base64 -in usbB/$nomB)

#charge Ra(b)
Ra=$(openssl enc -aes-256-cbc -d -k $B -base64 -in Ra)
Rb=$(openssl enc -aes-256-cbc -d -k $A -base64 -in Rb)

R=$(xor $Ra $Rb)

echo "entrez le groupe de l'individu suicidé de 2 balles dans le dos pour le bien commun :"
read gpC
echo "entrez l'identifiant de l'individu suicidé de 2 balles dans le dos pour le bien commun :"
read nomC

# TODO décrypt $gpC avec R
rm $gpC/$nomC
