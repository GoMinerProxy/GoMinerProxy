#!/bin/bash
screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "bash ./go_miner_proxy/run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
