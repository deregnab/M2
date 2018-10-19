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
Ka=$(openssl enc -aes-256-cbc -k $Ra -base64 -in A | base64 -d | gunzip -f)
Kb=$(openssl enc -aes-256-cbc -k $Rb -base64 -in B | base64 -d | gunzip -f)

key=$(xor $Ka $Kb)

# lit les entré soit via $1 soit stdin, et encrypte ligne par ligne les num de carte
echo entrez vos données, terminez par ctrl-D
while read line
do
    data=$data" "$(echo "$line" | cut -d':' -f1)":"$(echo "$line" | cut -d':' -f2 | openssl enc -aes-256-cbc -k $key -base64 )
done < "${1:-/dev/stdin}"

#enregistre le fichier crypté
echo $data >> file.enc
