#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "請在Root用戶下運行安裝該腳本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "這個安裝腳本不支持你的系統" && exit 1
fi


install(){
    if [ -d "/root/go_miner_proxy" ]; then
        echo -e "檢測到您已安裝GoMinerTool-ETHASH，請勿重複安裝，如您確認您未安裝請使用rm -rf /root/go_miner_proxy指令" && exit 1
    fi
    if screen -list | grep -q "go_miner_proxy"; then
        echo -e "檢測到您的GoMinerTool-ETHASH已啟動，請勿重複安裝" && exit 1
    fi

    $cmd update -y
    $cmd install wget screen -y
    
    mkdir /root/go_miner_proxy
    wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/scripts/run.sh -O /root/go_miner_proxy/run.sh --no-check-certificate
    chmod 777 /root/go_miner_proxy/run.sh
    wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/others/cert.tar.gz -O /root/go_miner_proxy/cert.tar.gz --no-check-certificate
    tar -zxvf /root/go_miner_proxy/cert.tar.gz -C /root/go_miner_proxy
    
    wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.4.2/GoMinerTool_v1.4.2_linux_amd64.tar.gz -O /root/GoMinerTool_v1.4.2_linux_amd64.tar.gz --no-check-certificate
    tar -zxvf /root/GoMinerTool_v1.4.2_linux_amd64.tar.gz -C /root/go_miner_proxy
    chmod 777 /root/go_miner_proxy/GoMinerProxy

    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'

    sleep 4s
    echo "GoMinerTool-ETHASH V1.4.2已經安裝到/root/go_miner_proxy"
    cat /root/go_miner_proxy/pwd.txt
    echo ""
    echo "您可以使用指令screen -r go_miner_proxy查看程式端口和密碼"
}


uninstall(){
    read -p "您確認您是否刪除GoMinerTool-ETHASH)[yes/no]：" flag
    if [ -z $flag ];then
         echo "您未正確輸入" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ];then
            screen -X -S go_miner_proxy quit
            rm -rf /root/go_miner_proxy
            echo "GoMinerTool-ETHASH已成功從您的伺服器上卸載"
        fi
    fi
}


update(){
    wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.4.2/GoMinerTool_v1.4.2_linux_amd64.tar.gz -O /root/GoMinerTool_v1.4.2_linux_amd64.tar.gz --no-check-certificate

    if screen -list | grep -q "go_miner_proxy"; then
        screen -X -S go_miner_proxy quit
    fi
    rm -rf /root/go_miner_proxy/GoMinerProxy

    tar -zxvf /root/GoMinerTool_v1.4.2_linux_amd64.tar.gz -C /root/go_miner_proxy
    chmod 777 /root/go_miner_proxy/GoMinerProxy

    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'

    sleep 4s
    echo "GoMinerTool-ETHASH 已經更新至V1.4.2版本並啟動"
    cat /root/go_miner_proxy/pwd.txt
    echo ""
    echo "您可以使用指令screen -r go_miner_proxy查看程式輸出"
}


start(){
    if screen -list | grep -q "go_miner_proxy"; then
        echo -e "檢測到您的GoMinerTool-ETHASH已啟動，請勿重複啟動" && exit 1
    fi
    
    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    
    echo "GoMinerTool-ETHASH已啟動"
    echo "您可以使用指令screen -r go_miner_proxy查看程式輸出"
}


restart(){
    if screen -list | grep -q "go_miner_proxy"; then
        screen -X -S go_miner_proxy quit
    fi
    
    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'

    echo "GoMinerTool-ETHASH 已經重新啟動"
    echo "您可以使用指令screen -r go_miner_proxy查看程式輸出"
}


stop(){
    screen -X -S go_miner_proxy quit
    echo "GoMinerTool-ETHASH 已停止"
}


change_limit(){
    if grep -q "1000000" "/etc/profile"; then
        echo -n "您的系統連接數限制可能已修改，當前連接限制："
        ulimit -n
        exit
    fi

    cat >> /etc/sysctl.conf <<-EOF

fs.file-max = 1000000
fs.inotify.max_user_instances = 8192

net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100

net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768

# forward ipv4
# net.ipv4.ip_forward = 1
EOF

    cat >> /etc/security/limits.conf <<-EOF
*               soft    nofile          1000000
*               hard    nofile          1000000
EOF

    echo "ulimit -SHn 1000000" >> /etc/profile
    source /etc/profile

    echo "系統連接數限制已修改，手動reboot重啟下系統即可生效"
}


check_limit(){
    echo -n "您的系統當前連接限制："
    ulimit -n
}


update_to_139(){
    wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.3.9/GoMinerProxy_v1.3.9_linux_amd64.tar.gz -O /root/GoMinerProxy_v1.3.9_linux_amd64.tar.gz --no-check-certificate

    if screen -list | grep -q "go_miner_proxy"; then
        screen -X -S go_miner_proxy quit
    fi
    rm -rf /root/go_miner_proxy/GoMinerProxy

    tar -zxvf /root/GoMinerProxy_v1.3.9_linux_amd64.tar.gz -C /root/go_miner_proxy
    chmod 777 /root/go_miner_proxy/GoMinerProxy

    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'

    sleep 4s
    echo "GoMinerTool-ETHASH 已經更新至V1.3.9版本並啟動"
    cat /root/go_miner_proxy/pwd.txt
    echo ""
    echo "您可以使用指令screen -r go_miner_proxy查看程式輸出"
}


echo "======================================================="
echo "GoMinerTool-ETHASH 一鍵腳本，脚本默认安装到/root/go_miner_proxy"
echo "GoMinerTool-ETHASH One-Click Script，PATH:/root/go_miner_proxy"
echo "                              腳本版本(Script Version)：V1.4.2"
echo "  1、安  裝 (Install)"
echo "  2、卸  載 (Uninstall)"
echo "  3、升級到最新版本 (Update to the latest version)"
echo "  4、啟  動 (Start)"
echo "  5、重  啟 (Restart)"
echo "  6、停  止 (Stop)"
echo "  7、一鍵解除Linux連接數限制,需手動重啟系統生效"
echo "     (Remove the limit on the number of Linux connections,"
echo "      Need to manually restart the system to take effect.)"
echo "  8、查看當前系統連接數限制 (View the current system connection limit)"
echo "  9、升級到V1.3.9 (Update to the V1.3.9)"
echo "======================================================="
read -p "$(echo -e "請選擇(Choose)[1-9]：")" choose
case $choose in
    1)
        install
        ;;
    2)
        uninstall
        ;;
    3)
        update
        ;;
    4)
        start
        ;;
    5)
        restart
        ;;
    6)
        stop
        ;;
    7)
        change_limit
        ;;
    8)
        check_limit
        ;;
    9)
        update_to_139
        ;;
    *)
        echo "請輸入正確的數字！(Please enter the correct number!)"
        ;;
esac