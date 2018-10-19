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

#charge Ka(b)
#TODO mettre le gzip pour que c puisse pas supr celui qui veut sans tout cassé
#Ka=$(openssl enc -aes-256-cbc -k $Ra -base64 -in A | base64 -d | gunzip -f)
#Kb=$(openssl enc -aes-256-cbc -k $Rb -base64 -in B | base64 -d | gunzip -f)
Ka=$( openssl enc -aes-256-cbc -d -pass pass:$passA -base64 -in A/$nomA)
Kb=$( openssl enc -aes-256-cbc -d -pass pass:$passB -base64 -in B/$nomB)


echo "identité du nouveau né :"
read nomC
echo "dans quel groupe $nomC sera t'il ajouté ?"
read gpC

echo -ne "$nomC entrez votre password:"
read -rs passC
echo ""

test "RST$gpC" = "RSTA" && echo "$Ka"| openssl enc -aes-256-cbc -pass pass:$passC -base64 >> $gpC/$nomC
test "RST$gpC" = "RSTB" && echo "$Kb"| openssl enc -aes-256-cbc -pass pass:$passC -base64 >> $gpC/$nomC

test "RST$gpC" = "RSTA" && echo "$A"| openssl enc -aes-256-cbc -pass pass:$passC -base64 >> usbA/$nomC
test "RST$gpC" = "RSTB" && echo "$B"| openssl enc -aes-256-cbc -pass pass:$passC -base64 >> usbB/$nomC
