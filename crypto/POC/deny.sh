#! /bin/bash

function  xor()
{
      local res=(`echo "$1" | sed "s/../0x& /g"`)
      shift 1
      while [[ "$1" ]]; do
            local one=(`echo "$1" | sed "s/../0x& /g"`)
            local count1=${#res[@]}
            if [ $count1 -lt ${#one[@]} ]
            then
                  count1=${#one[@]}
            fi
            for (( i = 0; i < $count1; i++ ))
            do
                  res[$i]=$((${one[$i]:-0} ^ ${res[$i]:-0}))
            done
            shift 1
      done
      printf "%02x" "${res[@]}"
}

#récupère les pass
echo -ne "A entrez votre password:"
read -rs passA
keyA=$(echo $passA | sha256sum | cut -d" " -f1)
echo -ne "\nB entrez votre password:"
read -rs passB
keyB=$(echo $passB | sha256sum | cut -d" " -f1)
echo ""

key=$(xor $(cat usbA) $(cat usbB))
#si passA est pas dans A, execution du traitre ...
A_clair=$(cat A | openssl enc -aes-256-cbc -d -k $key -base64)
echo "$A_clair" | grep $keyA >/dev/null || exit 65
#si passB est pas dans B, execution du traitre ...
B_clair=$(cat B | openssl enc -aes-256-cbc -d -k $key -base64)
echo "$B_clair" | grep $keyB >/dev/null || exit 66

#dans quel groupe voulait on remove la personne ?
test RST$1 = "RSTA" && gp=A
test RST$1 = "RSTB" && gp=B
test -z "$gp" && echo "a quel groupe retirer ? [A/B]" && read gp
#on lui demande son passe
echo -ne "$gp entrez votre password:"
read -rs pass
#on le remove du fichier

var=$(cat $gp | openssl enc -aes-256-cbc -d -k $key -base64 |grep -v $(echo $pass | sha256sum | cut -d" " -f1) )
echo $var
echo $var | openssl enc -aes-256-cbc -k $key -base64 > $gp
