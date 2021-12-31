#!/bin/bash
mkdir go_miner_proxy
wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/scripts/run.sh -O ./go_miner_proxy/run.sh
chmod 777 ./go_miner_proxy/run.sh

wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.0.2/GoMinerProxy_v1.0.2_linux_amd64.tar.gz -O GoMinerProxy_v1.0.2_linux_amd64.tar.gz
tar -zxvf GoMinerProxy_v1.0.2_linux_amd64.tar.gz -C ./go_miner_proxy
chmod 777 ./go_miner_proxy/GoMinerProxy

screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "cd go_miner_proxy"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'

echo "GoMinerProxy 已经安装完成并已启动"
echo "已启动网页后台，默认端口 9998，密码 admin"
echo "请您及时连接网页后台并修改默认密码，防止被人爆破"
echo "您可以使用指令screen -r go_miner_proxy查看程序输出"
