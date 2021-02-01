# 読み込めないパッケージを洗い出す

res <- sapply(
  # インストールされている全パッケージ
  .packages(all.available = TRUE),
  function(pkg){
    temp <- tryCatch(
        # 極力メッセージが表示されないようにパッケージを読み込む
        suppressMessages(
          require(pkg, character.only = TRUE, quietly = TRUE)
        ),
        # バイナリパッケージビルド時のRのバージョン違いは"ok"とする
        warning = function(w){
          ifelse(regexpr("was\ built\ under\ R\ version", w$message) > 0,
                 "ok", "Warning")
        },
        # エラーはとりあえずそのまま "Error" で返す
        error = function(e){ return("Error") }
      )
    
    # パッケージのロード成功の場合は "ok" で返す
    temp <- ifelse(temp == "TRUE", "ok", temp)
  })

# 読み込みに失敗したもの
res[res == "Warning"]
res[res == "Error"]
