#### ETHASH-1.3.5版本已重構完成，完美解決内存使用過多的問題，預計3月1日發佈，如有出現内存使用過多情況的用戶可以優先聯係我們領取測試版本。
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
