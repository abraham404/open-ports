#!/bin/bash

function ctrl_c(){
    
    echo -e "\n\n[!] Exit ...\n"
    
    tput cnorm; exit 1
}
    
trap ctrl_c INT

tput civis # hidden cursor

for port in $(seq 1 65535); do
    (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "[+] $port - OPEN" &
done; wait

tput cnorm # unhiden cursor