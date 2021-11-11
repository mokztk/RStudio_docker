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
- グラフ、PDF出力用フォントとして Noto Sans/Serif JP （"CJK" なし）を追加
    - Ubuntu の `fonts-noto-cjk` パッケージのみでは XeLaTeX + BXjscls で日本語PDFを作成するのに不足するウェイトがある
    - `fonts-noto-cjk-extra` は KR, SC, TC のフォントも含むので用途に対して大きすぎる（インストールサイズ 300MBほど）
    - 現在、[Noto Home - Google Fonts](https://fonts.google.com/noto) で配布されているのは "CJK" なしの Noto Sans/Serif JP のみ
    - Google Fonts からダウンロードして、XeLaTeX + BXjscls で "noto-jp" を指定する場合に必要な ７フォントを手動でインストールする
    - 過去コードの文字化け回避のため、Noto Sans/Serif CJK JP を Noto Sans/Serif JP の別名として登録しておく
- RStudioのエディタで使用するコーディング用フォントとして以下を追加
    - [JetBrains Mono](https://www.jetbrains.com/ja-jp/lp/mono/) : リガチャで `->` や native pipe `|>` が特別な記号になる
    - [PlemolJP](https://qiita.com/tawara_/items/0a7b8c50a48ea86b2d91) : IBM Plex Sans JP + IBM Plex Mono。3:5版ではなく通常版を使用

### radian: A 21 century R console

- https://github.com/randy3k/radian
- インストールには、Python 3用の pip が必要
- コード補完のためには `jedi` が必要なのであわせてインストール（radian の新しい版では jedi のバージョン縛りはなくなったよう）

### Python

- radian で使うために python をセットアップするので、R とも連携できるようにする
- そのままでは、Python共有ライブラリや Pandas がないので `reticulate` は動かない
- rocker project で用意されている `/rocker_scripts/install_python.sh` を利用する
- `Pandas` と `Seaborn` (`matplotlib`) をシステム側に入れておく

### TinyTeX

- XeLaTeX + BXjscls で日本語PDFを作成するのに必要なパッケージも予めインストールしてしまう
- 2021年3月末で TeX Live 2020 が更新終了（frozen）となったので、日本語 TeX 開発コミュニティ texjp.org のサーバにあるTeX Live 2020 のアーカイブを利用するようにする
- TinyTeX はそれに合わせて "2021.03" をインストールする

### R の頻用パッケージ

- いつものものに、Causal Inference Slack で勧められたものをいくつか追加
- https://docs.google.com/spreadsheets/d/175Q_lzNG7P6TT2k9rUzzweoaKdJS_OJZ3lWpUuTfcvc/edit#gid=0
- Bioconductor のパッケージも RSPM から入手できるようになったが、出自が分かりにくくなるので本家からインストール
- 容量節約のため、インストール後にDLしたアーカイブは削除する

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

