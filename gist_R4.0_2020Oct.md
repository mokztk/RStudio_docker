## About this image

- **rocker/tidyverse**
    - <s>現時点では `:4.0.1` で開発</s>
    - 2020-10-14 に [RSPM #344 (2020-10-13)](https://packagemanager.rstudio.com/all/__linux__/focal/344/src/contrib/PACKAGES) で固定されたのでベースを `:4.0.2` に変更
- Ubuntu mirror
    - 自動選択の `mirror://mirrors.ubuntu.com/mirrors.txt` に変更
    - Ref: https://blog.amedama.jp/entry/2019/09/11/234050
- 日本語ロケール
    - Ubuntu の `language-pack-ja`, `language-pack-ja-base`
    - 環境変数で `ja_JP.UTF-8` ロケールとタイムゾーン `Asia/Tokyo` を指定
    - フォントは下記のいずれか
        - <s>IPAex明朝/ゴシック（Ubuntu の `fonts-ipaexfont` パッケージ）</s>
        - Noto Sans/Serif JP（[Google Fonts](https://fonts.google.com/) で配布されている日本語サブセット版）
        - Noto Sans/Serif CJK JP（容量節約で `fonts-noto-cjk-extra` は使わず、[Google Noto Fonts](https://www.google.com/get/noto/) からOTF版をダウンロードして必要なものを手動でインストール）
- radian: A 21 century R console
    - https://github.com/randy3k/radian
    - インストールには、Python 3用の pip (python3-pip) が必要
- Python
    - radian で使うために python をセットアップするなら、R と連携できるようにする？
    - そのままでは、Python共有ライブラリや Pandas がないので `reticulate` は動かない
        - `# apt-get install -y libpython3.8 python3-pandas`
        - `# echo "/usr/lib/x86_64-linux-gnu" > /etc/ld.so.conf.d/libpython3.8.conf`
        - `# ldconfig`
        - `# Rscript -e "install.packages('reticulate')"`
- TinyTeX
    - XeLaTeX + BXjscls で日本語PDFを作成するのに必要なパッケージも予めインストールしてしまう
    - `rocker/tidyverse:4.0.2` になったら、 `install_tinytex(..., version = "2020.09")` など固定する？
- R の頻用パッケージ
    - いつものものに、Causal Inference Slack で勧められたものをいくつか追加
    - https://docs.google.com/spreadsheets/d/175Q_lzNG7P6TT2k9rUzzweoaKdJS_OJZ3lWpUuTfcvc/edit#gid=0
    - 容量節約のため、インストール後にDLしたアーカイブは削除する（約300MB分）
- 環境変数 PASSWORD の仮設定
    - 数ヶ月前から `DISABLE_AUTH` がうまく機能しなくなっていた（RStudio serverのcookie認証の問題とのこと）が、RStudio server 1.3.1093 では機能している
    - `DISABLE_AUTH=true` をイメージに埋め込んでしまうと、パスワードが有効にできなくなるので `DISABLE_AUTH` は起動オプションで
    - Docker Desktop など `-e PASSWORD=...` が設定できないGUIでも起動テストできるように仮のパスワードを埋め込んでおく

[rocker-org/rocker-versioned2](https://github.com/rocker-org/rocker-versioned2) のように、目的別のスクリプトを使って Dockerfile 自体は極力シンプルにしてみる。

Gist ではディレクトリが使えないので、各インストールスクリプトは "scripts__\*" として保存してある。\
`docker image build` の際は Dockerfile と同じ階層の "my_scripts" というディレクトリに "install_\*.sh" と改名して格納しておく。
改行コードが LF(UNIX) でないとエラーになるので注意。