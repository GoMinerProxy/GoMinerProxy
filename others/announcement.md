#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.7_ETHASH(2022-03-16)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.3.7) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
#### V1.3.7更新內容：此次版本為小版本更新，强烈芯動系列礦機用戶推荐更新。
- 內置礦池列表新增F2Pool SSL地址(ethssl-asia.f2pool.com:6698)
- 修復部分芯動系列礦機提交到礦池後礦機名變成默認defaults的情況
- 修復部分芯動系列礦機提交到礦池後無效份額過高的問題
- 針對芯動系列礦機進行針對性優化並實現完美兼容
- 前端優化：針對部分注意事項添加提示Tips
- 前端優化：禁止用戶修改開啟狀態下的代理池的抽水錢包地址、礦機名、抽水礦池信息，僅允許修改抽水率
- 前端優化：用戶修改代理池的抽水錢包地址、礦機名後，添加中文和特殊字符檢測並進行提示
- 前端優化：修改代理池修改邏輯，需先應用才可以開啟代理池
#### 注意：1、由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議。
----
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
