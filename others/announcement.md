#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.4_ETHASH(2022-04-25)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.4.0) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
#### V1.4.0更新內容：此次版本大版本更新，推薦用戶更新。
- 更新精準抽水算法(降低NiceHash協議抽水損耗，適配跨礦池抽水和動態難度，需在代理池設置中切換抽水算法)
- 修復數個BUG
#### 注意：1、由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議。
----
#### GoMinerTool-BTC 中轉已更新V1.1.1版本，[點擊查看更多信息](https://github.com/GoMinerProxy/GoMinerTool-BTC/releases/tag/1.1.1)。
#### GoMinerTool-T2S TCP轉SSL工具已發布V1.0.0版本，支持所有幣種，[點擊查看更多信息](https://github.com/GoMinerProxy/GoMinerTool-TCP2SSL)。
#### GoMinerTool-ETHASH V1.4.1正在抓緊開發中，針對礦池鏈接穩定性進行獨家優化，降低因伺服器网络波动导致的损耗，針對大量礦機的高並發環境進行優化，大幅優化内存占用。
----
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
