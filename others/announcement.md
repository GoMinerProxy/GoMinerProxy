#### ETHASH-1.3.6版本已發布，强烈建议1.3.1-1.3.5版本用戶更新！
----
#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.6_ETHASH(2022-03-01)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.3.6) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
#### V1.3.6更新內容：此次版本為大版本更新，强烈推荐更新。
- 對程式進行大幅度優化內存使用(實測60GH算力500帶機量情況下僅需360M內存)
- 對茉莉(JasMiner)品牌的專業礦機進行優化實現完美兼容，並添加更多專業礦機支持
- 新增後台-賬戶列表處的搜索框，用於對礦機名/錢包地址/IP地址進行檢索
- 修改內置礦池列表中HiveOnPool自動節點的地址為eth.hiveon.com:24443
- 修復動態修改抽水率的情況下可能引發的抽水不准確問題
- 內置Doh自適應安全化域名解析方案，防止DNS污染情況的出現
- 添加代理池設置NiceHash/Stratum2協議開關選項
- 優化主程式啟動時代理池自動開啟的邏輯
- 優化後台-程式設定處的人性化設計
- 新增後台-程式設定處的性能報告下載
#### 注意：1、由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議。
----
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
