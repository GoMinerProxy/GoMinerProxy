#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "請在Root用戶下運行安裝該腳本" && exit 1
wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.0.8/GoMinerProxy_v1.0.8_linux_amd64.tar.gz -O /root/GoMinerProxy_v1.0.8_linux_amd64.tar.gz

screen -X -S go_miner_proxy quit
rm -rf /root/go_miner_proxy/GoMinerProxy

tar -zxvf /root/GoMinerProxy_v1.0.8_linux_amd64.tar.gz -C /root/go_miner_proxy
chmod 777 /root/go_miner_proxy/GoMinerProxy

screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'

echo "GoMinerProxy 已經更新至V1.0.8版本並啟動"
echo "您可以使用指令screen -r go_miner_proxy查看程序輸出"
