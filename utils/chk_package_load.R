# 読み込めないパッケージを洗い出す

# 開始時に読み込まれているパッケージのリスト
base_list <- search()

# インストールされている全パッケージを一つずつ試す
res <- sapply(
  .packages(all.available = TRUE),
  function(pkg){
    temp <- tryCatch(
        # 極力メッセージが表示されないようにパッケージを読み込む
        suppressMessages(
          library(pkg, character.only = TRUE, quietly = TRUE)
        ),
        # Warning, Error の場合はその内容を返す。改行はスペースに置換
        warning = function(w){
          return(paste("[Warning]", gsub("\n", " ", w$message)))
        },
        error = function(e){
          return(paste("[Error]", gsub("\n", " ", e$message)))
        }
    )
    
    # 初期状態と比較して、新しくロードされたものを detach() する
    sapply(setdiff(search(), base_list),
           function(p) detach(pos = match(p, search())))
    
    # パッケージのロード成功の場合は "ok" で返す
    temp <- ifelse(pkg %in% temp, "ok", temp)
  })

# data frame に変換
res_df <- data.frame(cbind(
  package = names(res),
  result  = unname(res)
))

# 文字化け対策
res_df$result <- gsub("‘", "'", res_df$result)
res_df$result <- gsub("’", "'", res_df$result)

# CSVに結果を保存
write.csv(res_df, file = "~/library_test.csv")

# 読み込みに失敗したもの
res_df[grepl("\\[Warning\\]", res_df$result),]
res_df[grepl("\\[Error\\]", res_df$result),]
