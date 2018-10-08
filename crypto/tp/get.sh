#!/bin/bash


echo "PassPhrase A : "
read userA
echo "PassPhrase B : "
read userB

key=$(echo $userA | openssl enc -aes-256-cbc -pass pass:$userB  -base64)

test=$(openssl enc -d -aes-256-cbc -in file.crypt -k $key -base64)
echo $test

