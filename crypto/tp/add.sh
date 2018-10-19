echo "PassPhrase A : "
read -rs userA
echo "PassPhrase B : "
read -rs userB

key=$(echo $userA | openssl aes-256-cbc -pass pass:$userB -S $(cat salty)  -base64)
test=$(openssl enc -d -aes-256-cbc -in file.crypt -k $key -base64)
echo "information à ajouter"
read toadd
file=$(echo $test"*"$toadd)

echo $file | tr '*' '\n'
echo $file | openssl enc -aes-256-cbc -pass pass:$key -out file.crypt -base64

