#!/bin/bash

serverport=$1
echo testing against $serverport

for v in ssl2 ssl3 tls1 tls1_1 tls1_2 tls1_3; do
for c in $(openssl ciphers 'ALL:eNULL' | tr ':' ' '); do
openssl s_client -connect $serverport \
-cipher $c -$v < /dev/null > /dev/null 2>&1 && echo -e "$v:\t$c"
done
done