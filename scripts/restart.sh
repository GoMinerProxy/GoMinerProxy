#!/bin/bash
screen -X -S go_miner_proxy quit

screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "cd go_miner_proxy"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'

echo "GoMinerProxy 已經重新啟動"
