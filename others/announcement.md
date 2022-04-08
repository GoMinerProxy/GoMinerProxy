#### GoMinerTool-BTC 中轉已更新V1.1.0版本，[點擊查看更多信息](https://github.com/GoMinerProxy/GoMinerTool-BTC/releases/tag/1.1.0)。
#### GoMinerTool-T2S TCP轉SSL工具已發布V1.0.0版本，[點擊查看更多信息](https://github.com/GoMinerProxy/GoMinerTool-TCP2SSL)。
#### GoMinerTool-ETHASH V1.3.11正在抓緊開發中，即將修復BUG，更新實用功能，優化算法。
----
#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.9_ETHASH(2022-03-23)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.3.9) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
#### V1.3.9更新內容：此次版本為小版本更新，推薦1.3.1-1.3.8版本用戶更新。
- 新增新款專業礦機兼容
- 針對部分專業礦機進行優化
- 針對A11老版本固件針對性優化
- 修復一個可能引起崩潰的BUG
#### 注意：1、由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議。
----
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
