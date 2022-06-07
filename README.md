# About this image

- **rocker/tidyverse** に日本語設定、頻用パッケージ、TinyTeX関係をインストールした作業用イメージ
- RStudio server を開くまでもないような作業用に、[radian: A 21 century R console](https://github.com/randy3k/radian)を追加する
- `reticulate` で最低限の python 連携も使用できるようにする
- [rocker-org/rocker-versioned2](https://github.com/rocker-org/rocker-versioned2) のように、目的別のスクリプトを使って Dockerfile 自体は極力シンプルにしてみる

## 詳細

### Ubuntu mirror

- 自動選択の `mirror://mirrors.ubuntu.com/mirrors.txt` に変更
- Ref: https://blog.amedama.jp/entry/2019/09/11/234050

### 日本語環境、フォント

- Ubuntu の `language-pack-ja`, `language-pack-ja-base`
- 環境変数で `ja_JP.UTF-8` ロケールとタイムゾーン `Asia/Tokyo` を指定
- 以下の日本語フォントを導入
    - **Noto Sans/Serif JP**（"CJK"なし）
        - `fonts-noto-cjk-extra` は KR, SC, TC のフォントも含むので用途に対して大きすぎる（インストールサイズ 300MBほど）
        - [Google Fonts](https://fonts.google.com/) からダウンロードして、XeLaTeX + BXjscls で "noto-jp" を指定する場合に必要な ７フォントを手動でインストール
        - serif/sans の標準日本語フォントとして設定
        - 過去コードの文字化け回避のため、Noto Sans/Serif CJK JP を Noto Sans/Serif JP の別名として登録しておく
    - **[UDEV Gothic](https://github.com/yuru7/udev-gothic)**
        - BIZ UD Gothic + JetBrains Mono の合成フォント
        - 半角:全角 3:5版ではなく、通常の1:2でリガチャ有効のバージョン（UDEVGothicLG-*.ttf）を使用
        - RStudio Serverのエディタ用カスタムフォントとして導入
    - **[原ノ味フォント](https://github.com/trueroad/HaranoAjiFonts)**
        - TinyTeX (LuaLaTeX, XeLaTeX) で日本語PDFを作成するために `tinytex::tlmgr_install("haranoaji")` で導入
        - 予めインストールしておかないと、[Knit to PDF] 時の自動インストールで躓く

### R の頻用パッケージ

- これまでインストールしていたものを整理して利用頻度が少ない大物を中心に削除
- 容量節約のため、`--deps TRUE`指定（依存関係 Suggestsまで含める）は外し、インストール後にDLしたアーカイブは削除

### Quarto
- https://quarto.org/
- CRANレポジトリに合わせて、2022-06-02時点の最新版 Preview v0.9 Build 504 を使用
- Rパッケージ `quarto` もインストール

### Python3 & radian: A 21 century R console

- https://github.com/randy3k/radian
- rocker project で用意されている `/rocker_scripts/install_python.sh` を利用して Python3 をインストール
- R から Python を使えるよう、`reticulate` に必要な Pandas などもインストール（`Seaborn` も含む）
- radian のコード補完のためには `jedi` が必要なのであわせてインストール

### TinyTeX

- 2022年3月末で TeX Live 2021 が更新終了（frozen）となったので、日本語 TeX 開発コミュニティ texjp.org のサーバにあるTeX Live 2021 のアーカイブを利用する
- TinyTeX はそれに合わせて "2022.03" をインストール
- TinyTeX のセットアップまで行い、その他に必要なパッケージは自動インストールに任せる
    - 初回に日本語PDFを作成するときに自動でインストールされる（XeLaTeX + BXjscls の文書で約50個）
    - LuaLaTeXの場合、原ノ味フォントはインストールしておかないと進まなくなるので `haranoaji` だけ手動で入れておく
    - `/my_scripts/install_tex_packages.sh` をユーザー rstudio 権限で実行してインストールすることも可能

### 環境変数 PASSWORD の仮設定

- Docker Desktop など `-e PASSWORD=...` が設定できないGUIでも起動テストできるように仮のパスワードを埋め込んでおく
- 更に、普段使いのため `DISABLE_AUTH=true` を埋め込む。パスワードが必要なときは、起動時に `-e DISABLE_AUTH=false`

## History

- **2020-11-02** [Gist: mokztk/R4.0_2020Oct.Docerfile](https://gist.github.com/mokztk/be9e0d8982fd32987dbb5c9552a9d4a7) から改めてレポジトリとして編集を開始
- **2020-11-02** :bookmark:[4.0.2_2020Oct](https://github.com/mokztk/RStudio_docker/releases/tag/4.0.2_2020Oct) : `rocker/tidyverse:4.0.2` 対応版 
- **2021-01-14** :bookmark:[4.0.2_update2101](https://github.com/mokztk/RStudio_docker/releases/tag/4.0.2_update2101) : 4.0.2_2020Oct の修正版 
- **2021-03-06** :bookmark:[4.0.2_2021Jan](https://github.com/mokztk/RStudio_docker/releases/tag/4.0.2_2021Jan) : `rocker/tidyverse:4.0.2` ベースのままパッケージを更新
- **2021-03-11** :bookmark:[4.0.3_2020Feb](https://github.com/mokztk/RStudio_docker/releases/tag/4.0.3_2021Feb) : `rocker/tidyverse:4.0.3` にあわせて更新
- **2021-04-01**  ブランチ構成を再編（GitHub flow モドキ）
- **2021-04-04** :bookmark:[4.0.3_TL2020](https://github.com/mokztk/RStudio_docker/releases/tag/4.0.3_TL2020) : TeX を TeX Live 2020 (frozen) に固定
- **2021-04-13** :bookmark:[4.0.3_update2104](https://github.com/mokztk/RStudio_docker/releases/tag/4.0.3_update2104) : 4.0.3_TL2020 の修正版
- **2021-08-30** :bookmark:[4.1.0_2021Aug](https://github.com/mokztk/RStudio_docker/releases/tag/4.1.0_2021Aug) : `rocker/tidyverse:4.1.0` にあわせて更新。coding font 追加
- **2021-09-22** :bookmark:[4.1.0_2021Aug_r2](https://github.com/mokztk/RStudio_docker/releases/tag/4.1.0_2021Aug_r2) : PlemolJP フォントを最新版に差し替え（記号のズレ対策）
- **2021-11-11** :bookmark:[4.1.1_2021Oct](https://github.com/mokztk/RStudio_docker/releases/tag/4.1.1_2021Oct) : `rocker/tidyverse:4.1.1` にあわせて更新。フォント周りを中心に整理
- **2022-06-07** :bookmark:[4.2.0_2022Jun](https://github.com/mokztk/RStudio_docker/releases/tag/4.2.0_2022Jun) : ベースを `rocker/tidyverse:4.2.0` （2022-06-02版）に更新。Quartoの導入、フォントの変更など
