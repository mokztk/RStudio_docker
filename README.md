# About this image

- **rocker/tidyverse** に日本語設定、頻用パッケージ、TinyTeX関係をインストールした作業用イメージ
- RStudio server を開くまでもないような作業用に、[radian: A 21 century R console](https://github.com/randy3k/radian)を追加する
- `reticulate` で最低限の python 連携も使用できるようにする
- [rocker-org/rocker-versioned2](https://github.com/rocker-org/rocker-versioned2) のように、目的別のスクリプトを使って Dockerfile 自体は極力シンプルにしてみる

[Gist: mokztk/R4.0_2020Oct.Docerfile](https://gist.github.com/mokztk/be9e0d8982fd32987dbb5c9552a9d4a7) から改めてレポジトリとして編集を開始。

## 詳細

- Ubuntu mirror
    - 自動選択の `mirror://mirrors.ubuntu.com/mirrors.txt` に変更
    - Ref: https://blog.amedama.jp/entry/2019/09/11/234050
- 日本語ロケール
    - Ubuntu の `language-pack-ja`, `language-pack-ja-base`
    - 環境変数で `ja_JP.UTF-8` ロケールとタイムゾーン `Asia/Tokyo` を指定
    - フォントは下記のいずれか
        - <s>IPAex明朝/ゴシック（Ubuntu の `fonts-ipaexfont` パッケージ）</s>
        - Noto Sans/Serif JP（[Google Fonts](https://fonts.google.com/) で配布されている日本語サブセット版）
        - Noto Sans/Serif CJK JP
            - Ubuntu の `fonts-noto-cjk` パッケージのみでは XeLaTeX + BXjscls で日本語PDFを作成するのに不足
            - 自分の用途では、KR, SC, TC のフォントは不要
            - 容量節約で `fonts-noto-cjk-extra` は使わず、[Google Noto Fonts](https://www.google.com/get/noto/) からOTF版をダウンロードして必要なものを手動でインストール
- radian: A 21 century R console
    - https://github.com/randy3k/radian
    - インストールには、Python 3用の pip が必要
    - コード補完のためには `jedi` が必要だが、radian 0.51 時点では jedi 0.18 以降には対応していないので 0.17.2 を指定
- Python
    - radian で使うために python をセットアップするなら、R と連携できるようにする
    - そのままでは、Python共有ライブラリや Pandas がないので `reticulate` は動かない
    - rocker project で用意されている `/rocker_scripts/install_python.sh` を利用
    - `Pandas` と `Seaborn` (`matplotlib`) をシステム側に入れておく
- TinyTeX
    - XeLaTeX + BXjscls で日本語PDFを作成するのに必要なパッケージも予めインストールしてしまう
    - `tinytex::install_tinytex(..., version = "2020.10")` など固定しても、`tlmgr` の更新をしなければ他のパッケージがインストールできない？のでビルド時の最新で
- R の頻用パッケージ
    - いつものものに、Causal Inference Slack で勧められたものをいくつか追加
    - https://docs.google.com/spreadsheets/d/175Q_lzNG7P6TT2k9rUzzweoaKdJS_OJZ3lWpUuTfcvc/edit#gid=0
    - Bioconductor のパッケージも RSPM から入手できるようになった（2020-11-24リリースのRSPM v.1.2.0以降）
    - 容量節約のため、インストール後にDLしたアーカイブは削除する（約300MB分）
- 環境変数 PASSWORD の仮設定
    - Docker Desktop など `-e PASSWORD=...` が設定できないGUIでも起動テストできるように仮のパスワードを埋め込んでおく
    - 更に、普段使いのため `DISABLE_AUTH=true` を埋め込む。パスワードが必要なときは、起動時に `-e DISABLE_AUTH=false`
