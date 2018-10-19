#!/bin/bash


echo "PassPhrase A : "
read -rs userA
echo "PassPhrase B : "
read -rs userB

key=$(echo $userA | openssl aes-256-cbc -pass pass:$userB -S $(cat salty)  -base64)

test=$(openssl enc -d -aes-256-cbc -in file.crypt -k $key -base64)
echo $test

