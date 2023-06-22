# About this image

- **rocker/tidyverse** に日本語設定、頻用パッケージ、TinyTeX関係をインストールした作業用イメージ
    - ARM64 版も rocker/r-ver を出発点に rocker/tidyverse ＋日本語設定、頻用パッケージを導入する
- RStudio server を開くまでもないような作業用に、[radian: A 21 century R console](https://github.com/randy3k/radian)を追加する
- `reticulate` で最低限の python 連携も使用できるようにする
- [rocker-org/rocker-versioned2](https://github.com/rocker-org/rocker-versioned2) のように、目的別のスクリプトを使って Dockerfile 自体は極力シンプルにしてみる

## 詳細

### Ubuntu mirror

- x86_64 の場合は日本のミラーサーバーで一番回線が太い ICSCoE（IPA産業サイバーセキュリティセンター）に変更
- arm64 は置かれていないミラーサーバーも多いので変更しない

### 日本語環境、フォント

- Ubuntu の `language-pack-ja`, `language-pack-ja-base`
- 環境変数で `ja_JP.UTF-8` ロケールとタイムゾーン `Asia/Tokyo` を指定
- 以下の日本語フォントを導入
    - **Noto Sans/Serif JP**（"CJK"なし）
        - `fonts-noto-cjk-extra` は KR, SC, TC のフォントも含むので用途に対して大きすぎる（インストールサイズ 300MBほど）
        - Github [notofonts/noto-cjk](https://github.com/notofonts/noto-cjk) から個別のOTF版をダウンロードして、XeLaTeX + BXjscls で "noto-jp" を指定する場合に必要な ７フォントを手動でインストール
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

- 容量節約のため、`--deps TRUE`指定（依存関係 Suggestsまで含める）は外し、インストール後にDLしたアーカイブは削除
- rockerのスクリプトに倣い、インストール後にRSPMのバイナリパッケージで導入された *.so を整理
- arm64版では、容量の大きな dbplyr database backend は省略

### Quarto
- https://quarto.org/
- x86_64 では `/rocker_scripts/install_quarto.sh` で RStudio にバンドルされているもの（`QUARTO_VERSION=default`）をインストール
- arm64 では公式で配布されている Linux Arm64 版を手動でインストール
- Rパッケージ `quarto` もインストールし R Console からも使えるようにする（arm版では RStudio 上でうまく変換できない）

### Python3 & radian: A 21 century R console

- https://github.com/randy3k/radian
- rocker project で用意されている `/rocker_scripts/install_python.sh` を利用して Python3 をインストール
- R から Python を使えるよう、`reticulate` に必要な Pandas などもインストール（`Seaborn` も含む）
- radian のコード補完のためには `jedi` が必要なのであわせてインストール
- python 3.10 の依存関係でトラブルが発生するので暫定的にダウングレード（3.10.6-1~22.04.2ubuntu1.1 -> 3.10.6-1~22.04.2ubuntu1）

### TinyTeX

- 2023年3月で TeX Live 2022 が更新終了（frozen）となったので、日本語 TeX 開発コミュニティ texjp.org のサーバにあるTeX Live 2022 のアーカイブを利用する
- TinyTeX はそれに合わせて "2023.03" をインストール
- TinyTeX のセットアップまで行い、その他に必要なパッケージは自動インストールに任せる
    - 初回に日本語PDFを作成するときに自動でインストールされる（XeLaTeX + BXjscls の文書で約50個）
    - LuaLaTeXの場合、原ノ味フォントはインストールしておかないと進まなくなるので `haranoaji` だけ手動で入れておく
    - `/my_scripts/install_tex_packages.sh` をユーザー rstudio 権限で実行してインストールすることも可能
- arm64 は非対応なので、セットアップは行わない

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
- **2022-06-24** :bookmark:[4.2.0_2022Jun_2](https://github.com/mokztk/RStudio_docker/releases/tag/4.2.0_2022Jun_2) : ベースを `rocker/tidyverse:4.2.0` snapshot確定版に更新。Quarto関係を修正
- **2023-04-06** :bookmark:[4.2.2_2023Mar](https://github.com/mokztk/RStudio_docker/releases/tag/4.2.2_2023Mar) : `rocker/tidyverse:4.2.2` にあわせて更新。ARM64版を試作
- **2023-06-21** :bookmark:[4.2.2_2023Mar_2](https://github.com/mokztk/RStudio_docker/releases/tag/4.2.2_2023Mar_2) : Noto Sans JP フォントの導入に失敗していたのを修正
- **2023-06-23** :bookmark:[4.3.0_2023Jul](https://github.com/mokztk/RStudio_docker/releases/tag/4.3.0_2023Jul) : `rocker/tidyverse:4.3.0` にあわせて更新
