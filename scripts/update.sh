#!/bin/bash
wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.0.2/GoMinerProxy_v1.0.2_linux_amd64.tar.gz -O GoMinerProxy_v1.0.2_linux_amd64.tar.gz

screen -X -S go_miner_proxy quit
rm -rf ./go_miner_proxy/GoMinerProxy

tar -zxvf GoMinerProxy_v1.0.2_linux_amd64.tar.gz -C ./go_miner_proxy
chmod 777 ./go_miner_proxy/GoMinerProxy

screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "cd go_miner_proxy"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
