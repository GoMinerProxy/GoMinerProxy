<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/images/logo.png" width="350"/>
</h1>

<h4 align="center">A high-performance multi-threaded ETH/ETC mining pool forwarding and relay agent tool based on GoLang.</h4>
<h4 align="center">BTC forwarding please enter(https://github.com/GoMinerProxy/GoMinerTool-BTC)</h4> 

<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-1.4.4_ETHASH-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2022_05_29-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Language-GoLang-green.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/License-Apache-green.svg" alt="travis">
  </a>
</p>

<p align="center">
  <a href="https://github.com/GoMinerProxy/GoMinerProxy/tree/main/readmes/zh-hk">繁體中文(zh-hk)</a> •
  <a href="https://github.com/GoMinerProxy/GoMinerProxy/tree/main/readmes/zh-cn">簡體中文(zh-cn)</a> •
  <a href="https://github.com/GoMinerProxy/GoMinerProxy/tree/main/readmes/en-us/">English(en-us)</a> •
  <a href="https://gominerproxy.github.io/zh_hk/">Docs</a> •
  <a href="https://t.me/+afVqEXnxtQAyNWNh">Telegram discussion group</a> •
  <a href="https://t.me/go_minerproxy">Telegram notification channel</a>
</p>

![Screenshot](https://raw.githubusercontent.com/GoMinerProxy/GoMinerProxy/main/images/web_1.png)

## :sparkles: Function

* :cloud: Mining pool forwarding: support ETH/ETC relay agent, support all Stratum/NiceHash/Stratum2 protocols, and facilitate unified management (other currencies will be updated soon)
* :zap: Ultra-high performance: written in the efficient GoLang language and optimized for multi-threading
* 💻 Custom pumping: support the relay platform to customize the pumping ratio for pumping, and support dynamic modification without closing the proxy pool
* 📚 A variety of pumping algorithms: users can choose various pumping algorithms to prevent the computing power from appearing periodic functions or heartbeat diagrams
* 💾 Security and stability: support TCP, SSL and other methods, and write certain strategies to protect against CC attacks
* :gear: Exclusive pre-agent mode: supports encryption and obfuscation from the transfer server to the mining pool, and can be deployed on the intranet
* :outbox_tray: Batch forwarding: One software can start forwarding to multiple mining pools, no need to start multiple processes
* :card_file_box: Hot modification: The configuration can be hot modified on the background of the web page, no need to modify the cumbersome configuration file and restart
* :art: Exquisite background: the background web page has comprehensive functions, line charts, rich statistics, dark mode, multi-language support
* :eye_speech_bubble: Improve community support: The Telegram group can help solve various problems encountered, and feedback and suggestions are welcome
* :rocket: Out of the box: All-In-One packaging, one-click build and run, one-click configuration
* :family_woman_girl_boy: Multi-system support: Windows, Linux, MacOS can be supported and used without additional environment, etc.
* :gear: Professional team: With rich experience in blockchain development, many developers come from the prestigious Hong Kong University of Science and Technology
* :link: Quick response: You can choose to enable it, disguise low latency (the delay displayed at the user's kernel delay is the delay from the miner to the transit server), and clean up invalid submissions
* 🌈 ... ...

## :hammer_and_wrench: Deploy

See the latest software version：<a href="https://github.com/GoMinerProxy/GoMinerProxy/releases">Github Release</a></br>
Windows directly download the main program suitable for your target machine operating system and CPU architecture, and run it directly.<a href="https://gominerproxy.github.io/zh_hk/1%20-%20%E5%BF%AB%E9%80%9F%E9%96%8B%E5%A7%8B/1.1%20-%20Windows%E7%B3%BB%E7%B5%B1.html">Windows detailed tutorial</a>
</br>
Linux You can run it according to the following instructions, please note that the download link needs to be suitable for your target machine operating system and CPU architecture.<a href="https://gominerproxy.github.io/zh_hk/1%20-%20%E5%BF%AB%E9%80%9F%E9%96%8B%E5%A7%8B/1.2%20-%20Linux%E7%B3%BB%E7%B5%B1.html">Linux detailed tutorial</a>

### Linux one-click management script (with its own crash restart, but no boot and self-start)
```shell
# except China server available
bash <(curl -s -L https://git.io/JSHsQ)
# China server available
bash <(curl -s -L https://cdn.jsdelivr.net/gh/GoMinerProxy/GoMinerProxy@main/scripts/manage_proxy.sh)
```
```shell
# The SSH link again can use the following command to view the output
screen -r go_miner_proxy
```
The above is the simplest deployment example, you can refer to [Documentation - Quick Start](https://gominerproxy.github.io/zh_hk/) for more complete deployment.

## :alembic: Technology

* [Go](https://golang.org/) + [Gin](https://github.com/gin-gonic/gin)
* [NodeJs](https://nodejs.org/) + [GitBook](https://www.gitbook.com/)
* [Vue.JS](https://vuejs.org/) + [vue-element](https://panjiachen.github.io/vue-element-admin-site/zh/)

## :scroll: Cost
* Constant 0.3%
