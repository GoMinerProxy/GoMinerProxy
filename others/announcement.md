#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.0_ETHASH(2022-02-04)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.3.0)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
#### V1.3.0更新內容：此次版本為大版本更新，強烈建議更新。
- 新增支持不關閉代理池的情況下動態修改代理池抽水率和僞裝本地提交算力(Reported Hashrate )百分比
- 修改允許最大抽水率為40%, 並修復極端情況下設置多個相同的抽水賬戶(錢包地址和礦機名完全相同)的情況下導致的CPU利用率上升
- 修復處理礦機請求時出現致命錯誤: runtime error: invalid memory address or nil pointer dereference
- 新增網頁後台監控服務器資源使用情況
- 新增網頁後台在綫數、算力、提交折線圖
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
