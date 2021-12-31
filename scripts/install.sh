#!/bin/bash
mkdir go_miner_proxy
wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/scripts/run.sh -O ./go_miner_proxy/run.sh
chmod 777 ./go_miner_proxy/run.sh

wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.0.3/GoMinerProxy_v1.0.3_linux_amd64.tar.gz -O GoMinerProxy_v1.0.3_linux_amd64.tar.gz
tar -zxvf GoMinerProxy_v1.0.3_linux_amd64.tar.gz -C ./go_miner_proxy
chmod 777 ./go_miner_proxy/GoMinerProxy

screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "cd go_miner_proxy"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'

echo "GoMinerProxy 已經安裝完成並已啟動"
echo "已啟動網頁後台，默認端口 9998，密碼 admin"
echo "請您及時連接網頁後台並修改默認密碼，防止被人爆破"
echo "您可以使用指令screen -r go_miner_proxy查看程序輸出"
