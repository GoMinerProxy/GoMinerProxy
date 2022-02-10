#### 近期發現有人使用默認密碼惡意掃描程式後臺，請安裝程式後第一時間修改後臺密碼，1.3.2版本程式已改爲隨機密碼。如之前為默認密碼沒有修改，請第一時間檢查自定義礦池中是否出現非自己添加的第三方IP。
----
#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.3_ETHASH(2022-02-10)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.3.3) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
#### V1.3.3更新內容：此次版本為小版本更新，可以選擇不更新，建議需要CrazyPool的用戶或1.3.1/1.3.2版本更新。
- 優化1.3.1/1.3.2版本的內存佔用情況
- 修復ETC內置礦池地址中 2Miners 亞洲節點信息配置錯誤的問題
- 修復ETC自定義礦池地址無法連接的問題
- 修復1.3.2無法動態修改抽水率的問題
#### 注意：1、由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議。
----
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
