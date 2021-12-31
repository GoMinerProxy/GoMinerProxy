#!/bin/bash
wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.0.2/GoMainerProxy_v1.0.2_linux_amd64.tar.gz

screen -X -S go_miner_proxy quit
rm -rf ./go_miner_proxy/GoMinerProxy

tar -zxvf GoMainerProxy_v1.0.2_linux_amd64.tar.gz -C ./go_miner_proxy
chmod 777 ./go_miner_proxy/GoMinerProxy

screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "bash ./go_miner_proxy/run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
