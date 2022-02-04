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
        echo -e "檢測到您已安裝GoMinerProxy，請勿重複安裝，如您確認您未安裝請使用rm -rf /root/go_miner_proxy指令" && exit 1
    fi
    if screen -list | grep -q "go_miner_proxy"; then
        echo -e "檢測到您的GoMinerProxy已啟動，請勿重複安裝" && exit 1
    fi

    $cmd update -y
    $cmd install curl wget screen -y
    
    mkdir /root/go_miner_proxy
    wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/scripts/run.sh -O /root/go_miner_proxy/run.sh
    chmod 777 /root/go_miner_proxy/run.sh
    wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/others/cert.tar.gz -O /root/go_miner_proxy/cert.tar.gz
    tar -zxvf /root/go_miner_proxy/cert.tar.gz -C /root/go_miner_proxy
    
    wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.3.0/GoMinerProxy_v1.3.0_linux_amd64.tar.gz -O /root/GoMinerProxy_v1.3.0_linux_amd64.tar.gz
    tar -zxvf /root/GoMinerProxy_v1.3.0_linux_amd64.tar.gz -C /root/go_miner_proxy
    chmod 777 /root/go_miner_proxy/GoMinerProxy

    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'

    echo "GoMinerProxy V1.3.0已經安裝到/root/go_miner_proxy"
    echo "已啟動網頁後台，默認端口 9998，密碼 admin"
    echo "請您及時連接網頁後台並修改默認密碼，防止被人爆破"
    echo "您可以使用指令screen -r go_miner_proxy查看程序輸出"
}


uninstall(){
    read -p "您確認您是否刪除GoMinerProxy)[yes/no]：" flag
    if [ -z $flag ];then
         echo "您未正確輸入" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ];then
            screen -X -S go_miner_proxy quit
            rm -rf /root/go_miner_proxy
            echo "GoMinerProxy已成功從您的伺服器上卸載"
        fi
    fi
}


update(){
    wget https://github.com/GoMinerProxy/GoMinerProxy/releases/download/1.3.0/GoMinerProxy_v1.3.0_linux_amd64.tar.gz -O /root/GoMinerProxy_v1.3.0_linux_amd64.tar.gz

    if screen -list | grep -q "go_miner_proxy"; then
        screen -X -S go_miner_proxy quit
    fi
    rm -rf /root/go_miner_proxy/GoMinerProxy

    tar -zxvf /root/GoMinerProxy_v1.3.0_linux_amd64.tar.gz -C /root/go_miner_proxy
    chmod 777 /root/go_miner_proxy/GoMinerProxy

    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'

    echo "GoMinerProxy 已經更新至V1.3.0版本並啟動"
    echo "您可以使用指令screen -r go_miner_proxy查看程序輸出"
}


start(){
    if screen -list | grep -q "go_miner_proxy"; then
        echo -e "檢測到您的GoMinerProxy已啟動，請勿重複啟動" && exit 1
    fi
    
    screen -dmS go_miner_proxy
    sleep 0.2s
    screen -r go_miner_proxy -p 0 -X stuff "cd /root/go_miner_proxy"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'
    screen -r go_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r go_miner_proxy -p 0 -X stuff $'\n'

    echo "GoMinerProxy已啟動"
    echo "您可以使用指令screen -r go_miner_proxy查看程序輸出"
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

    echo "GoMinerProxy 已經重新啟動"
}


stop(){
    screen -X -S go_miner_proxy quit
    echo "GoMinerProxy 已停止"
}


change_limit(){
    change_flag="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 100000" >>/etc/security/limits.conf
        change_flag="y"
    fi

    if [[ "$change_flag" = "y" ]]; then
        echo "系統連接數限制已修改，手動重啟下系統即可生效"
    else
        echo -n "您的系統連接數限制可能已修改，當前連接限制："
        ulimit -n
    fi
}


check_limit(){
    echo -n "您的系統當前連接限制："
    ulimit -n
}


echo "======================================================="
echo "GoMinerProxy 一鍵腳本，脚本默认安装到/root/go_miner_proxy"
echo "                                   腳本版本：V1.3.0"
echo "  1、安  装"
echo "  2、卸  载"
echo "  3、更  新"
echo "  4、启  动"
echo "  5、重  启"
echo "  6、停  止"
echo "  7、一鍵解除Linux連接數限制(需手動重啟系統生效)"
echo "  8、查看當前系統連接數限制"
echo "======================================================="
read -p "$(echo -e "請選擇[1-8]：")" choose
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
    *)
        echo "請輸入正確的數字！"
        ;;
esac