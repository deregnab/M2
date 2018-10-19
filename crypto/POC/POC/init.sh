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

#TODO changer urandom par random (+ long mais vrai random)
#allez hop, 512 octet on sera bon on génére les clef A et B
Ka=$(dd if=/dev/urandom bs=4 count=128 2>/dev/null | hexdump -v -e '/1 "%02x"')
Kb=$(dd if=/dev/urandom bs=4 count=128 2>/dev/null | hexdump -v -e '/1 "%02x"')

#on génére aussi A, B et Ra et Rb
A=$(dd if=/dev/urandom bs=4 count=128 2>/dev/null | hexdump -v -e '/1 "%02x"')
B=$(dd if=/dev/urandom bs=4 count=128 2>/dev/null | hexdump -v -e '/1 "%02x"')
dd if=/dev/urandom bs=4 count=128 2>/dev/null | hexdump -v -e '/1 "%02x"' | openssl enc -aes-256-cbc -k $B -base64 -out Ra
dd if=/dev/urandom bs=4 count=128 2>/dev/null | hexdump -v -e '/1 "%02x"' | openssl enc -aes-256-cbc -k $A -base64 -out Rb

key=$(xor $Ka $Kb)

# lit les entré soit via $1 soit stdin, et encrypte ligne par ligne les num de carte
echo entrez vos données, terminez par ctrl-D
while read line
do
    data=$data" "$(echo "$line" | cut -d':' -f1)":"$(echo "$line" | cut -d':' -f2 | openssl enc -aes-256-cbc -k $key -base64 )
done < "${1:-/dev/stdin}"

#enregistre le fichier crypté
echo $data > file.enc

#le passA(B) dans le groupe A(B)
echo "A entrez votre identifiant :"
read nomA
echo -ne "$nomA entrez votre password:"
read -rs passA
echo ""
#dirA=$(echo "$Ka"| openssl enc -aes-256-cbc -pass pass:$passA -base64) #TODO mettre le gzip pour que c puisse pas supr celui qui veut sans tout cassé
mkdir A
echo "$Ka"| openssl enc -aes-256-cbc -pass pass:$passA -base64 > A/$nomA

echo "B entrez votre identifiant :"
read nomB
echo -ne "$nomB entrez votre password:"
read -rs passB
echo ""
#dirB=$(echo "$Kb"| openssl enc -aes-256-cbc -pass pass:$passB -base64)
mkdir B #TODO mettre le gzip pour que c puisse pas supr celui qui veut sans tout cassé
echo "$Kb"| openssl enc -aes-256-cbc -pass pass:$passB -base64 > B/$nomB
tar zcvf A.tar.gz A
tar zcvf B.tar.gz B
key2=$(xor $Ra $Rb)
cat A.tar.gz | openssl enc -aes-256-cbc -k $key2 -base64 >A.enc
cat B.tar.gz | openssl enc -aes-256-cbc -k $key2 -base64 >B.enc
#TODO mettre le gzip pour que c puisse pas supr celui qui veut sans tout cassé
#echo $dirA | gzip -f | openssl enc -aes-256-cbc -k $Ra -base64 > A
#echo $dirB | gzip -f | openssl enc -aes-256-cbc -k $Rb -base64 > B

mkdir usbA
mkdir usbB

echo "$A"| openssl enc -aes-256-cbc -pass pass:$passA -base64 >> usbA/$nomA
echo "$B"| openssl enc -aes-256-cbc -pass pass:$passB -base64 >> usbB/$nomB
