#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.4.2_ETHASH(2022-04-30)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.4.2) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
#### V1.4.2更新內容：此次版本大版本更新，推薦用戶更新。
- 針對礦池鏈接穩定性進行獨家優化，降低因伺服器网络波动导致的损耗
- 針對大量礦機的高並發環境進行優化
- 大幅優化CPU和内存占用情況
- 優化網絡帶寬使用
- 修復前置代理模式的代理池初始化timeout問題
#### 注意：
- 抽水實到1G以上建議不要抽水到F2pool，由於F2pool為動態難度會把難度提升到32G以上，導致批量上綫的礦機突發抽水，只能保證24小時平均算力正確
- 由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議
----
#### GoMinerTool-ETHASH V1.4.3正在抓緊開發中，新增統一錢包功能。
#### GoMinerTool-BTC 中轉已更新V1.1.1版本，[點擊查看更多信息](https://github.com/GoMinerProxy/GoMinerTool-BTC/releases/tag/1.1.1)。
#### GoMinerTool-T2S TCP轉SSL工具已發布V1.0.0版本，支持所有幣種，[點擊查看更多信息](https://github.com/GoMinerProxy/GoMinerTool-TCP2SSL)。
----
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
