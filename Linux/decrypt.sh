#1/bin/bash
$1=encrypted file
$2=key
$3=iv
openssl enc -pbkdf2 -nosalt -aes-256-cbc -in $1 -d -base64 -k $2 -iv $3                                                  