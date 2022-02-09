#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.3.2_ETHASH(2022-02-09)](https://github.com/GoMinerProxy/GoMinerProxy/releases/tag/1.3.2) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerProxy/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerProxy)
----
#### V1.3.2更新內容：此次版本為小版本更新，可以選擇不更新，建議需要CrazyPool的用戶或1.3.1版本更新。
- 新增Guest訪客模式，提供賬戶列表信息查看
- 對配置文件進行加密，升級至該版本後回退版本將無法保留配置
- 程式初次安裝後網頁後台登錄端口修改為隨機端口，初始弱密碼修改為隨機密碼
- 新增後台處修改密碼時對密碼強度的檢測和對弱密碼的警告
- 新增後台修改密碼後默認跳轉回登錄頁
- 針對1.3.1版本下程式抽水連接F2Pool使用NiceHash協議不支持匿名地址的問題進行兼容
- 針對1.3.1版本下HiveonPool礦池不兼容NiceHash協議的問題進行兼容
- 新增使用NiceHash協議的礦機在賬戶列表處的難度顯示
- 修復某個極端條件下可能引發的請求BUG
#### 注意：由於協議差異, 目前無法實現跨協議抽水, 所以如果設置CrazyPool為歸集目標的話需要客戶端均使用NiceHash/Stratum2協議。
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
