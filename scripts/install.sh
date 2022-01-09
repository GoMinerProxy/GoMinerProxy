#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "請在Root用戶下運行安裝該腳本" && exit 1
if [ -d "/root/go_miner_proxy" ]; then
    echo -e "檢測到您已安裝GoMinerProxy，請勿重複運行安裝腳本，如您確認您未安裝請使用rm -rf /root/go_miner_proxy指令" && exit 1
fi
if screen -list | grep -q "go_miner_proxy"; then
    echo -e "檢測到您的GoMinerProxy已啟動，請勿重複運行安裝腳本" && exit 1
fi

mkdir /root/go_miner_proxy
echo "您是否需要開啟SSL(開啟SSL後將使用自簽證書運行，如果內核"
read -p "校驗證書則需要自行上傳自己證書的域名)[yes/no]：" flag
if [ -z $flag ];then
    echo "您未正確輸入" && exit 1
else
    if [ "$flag" = "yes" ];then
       wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/others/cert.tar.gz -O /root/go_miner_proxy/cert.tar.gz
       tar -zxvf /root/go_miner_proxy/cert.tar.gz -C /root/go_miner_proxy
    fi
fi

wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/scripts/run.sh -O /root/go_miner_proxy/run.sh
chmod 777 /root/go_miner_proxy/run.sh

wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.1.0/GoMinerProxy_v1.1.0_linux_amd64.tar.gz -O /root/GoMinerProxy_v1.1.0_linux_amd64.tar.gz
tar -zxvf /root/GoMinerProxy_v1.1.0_linux_amd64.tar.gz -C /root/go_miner_proxy
chmod 777 /root/go_miner_proxy/GoMinerProxy

screen -dmS go_miner_proxy
sleep 0.2s
screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
screen -r go_miner_proxy -p 0 -X stuff $'\n'
screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
screen -r go_miner_proxy -p 0 -X stuff $'\n'

echo "GoMinerProxy V1.1.0已經安裝到/root/go_miner_proxy"
echo "已啟動網頁後台，默認端口 9998，密碼 admin"
echo "請您及時連接網頁後台並修改默認密碼，防止被人爆破"
echo "您可以使用指令screen -r go_miner_proxy查看程序輸出"