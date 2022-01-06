#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "請在Root用戶下運行安裝該腳本" && exit 1
screen -X -S go_miner_proxy quit
rm -rf /root/go_miner_proxy

echo "GoMinerProxy已成功從您的服務器上卸載"
