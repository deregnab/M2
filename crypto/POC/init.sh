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

dd if=/dev/random bs=4 count=4 2>/dev/null | hexdump -v -e '/1 "%02x"' | base64 > usbA
dd if=/dev/random bs=4 count=4 2>/dev/null | hexdump -v -e '/1 "%02x"' | base64> usbB
key=$(xor $(cat usbA) $(cat usbB))
#le passA(B) dans le groupe A(B) 
echo "$keyA"| openssl enc -aes-256-cbc -k $key -base64 >> A
echo "$keyB"| openssl enc -aes-256-cbc -k $key -base64 >> B




# lit les entré soit via $1 soit stdin, et encrypte ligne par ligne les num de carte
echo entrez vos données, terminez par ctrl-D
while read line
do
    clair=$clair" "$(echo "$line" | cut -d':' -f1)":"$(echo "$line" | cut -d':' -f2 | openssl enc -aes-256-cbc -k $key -base64 )
done < "${1:-/dev/stdin}"


#enregistre le fichier crypté
echo $clair > file.enc
