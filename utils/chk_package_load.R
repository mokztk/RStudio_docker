# 読み込めないパッケージを洗い出す

res <- sapply(
  # インストールされている全パッケージ
  .packages(all.available = TRUE),
  function(pkg){
    # 各パッケージの読み込みが成功すれば "ok", 失敗は "BAD"
    ifelse(
      tryCatch(
        # 極力メッセージが表示されないようにパッケージを読み込む
        suppressMessages(
          require(pkg, character.only = TRUE, quietly = TRUE)
        ),
        # エラー、警告は無視する
        warning = function(w){ return(FALSE) },
        error   = function(e){ return(FALSE) }
      ),
      "ok", "BAD")
  })

# 結果が "BAD" のもののみ
res[res == "BAD"]

