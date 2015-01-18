# language: zh-TW

功能: 登入 ezScrum

  場景: 輸入帳號密碼來進入 ezScrum
    假如 我已經在 ezScrum 的登入頁面
      當 輸入帳號密碼並登入
    那麼 我可以在畫面的右上角看到我的帳號和名稱"admin(admin)"


  場景大綱: 輸入帳號密碼來進入 ezScrum
    假如 我已經在 ezScrum 的登入頁面
      當 輸入"<帳號>"和"<密碼>"並登入
    那麼 我可以在畫面的右上角看到"<帳號資訊>"

    例子: 
    | 帳號 | 密碼 |  帳號資訊  |
    | admin| admin|admin(admin)|
    | test1| test1|test1(test1)|