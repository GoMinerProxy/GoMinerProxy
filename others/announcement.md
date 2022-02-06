#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.1_ETHASH(2022-02-07)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.3.1) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
----
#### V1.3.1更新內容：此次版本為小版本更新，可以選擇不更新，建議需要CrazyPool的用戶更新。
- 針對使用NiceHash/Stratum2協議的礦池進行兼容並實現自適應切換
- 內置礦池新增Crazypool (NiceHash協議池)
- 對部分新款專業礦機進行兼容
- 修復了主頁性能圖中內存單位GB顯示為B的顯示問題
- 修復了無法指定自定義礦池為抽水目標的問題
注意：由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議。
已知問題：礦機使用NiceHash/Stratum2協議的情況下暂时無法獲取難度，將在後續更新進行支持。
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
