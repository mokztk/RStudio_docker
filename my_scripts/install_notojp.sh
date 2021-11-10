#!/bin/bash

# Noto Sans/Serif JP フォントのインストール
# apt で fonts-noto-cjk + fonts-noto-cjk-extra を入れると300MB超となるため最低限のものを手動で導入する

# Google Fonts で配布されている日本語フォントが "CJK" なしの Noto Sans/Serif JP になった
# ファイルサイズは webフォント版と同じようだが、Google Fonts の配布パッケージのものを使用する
# zxjafont.sty のプリセット名は "noto" ではなく、"noto-jp" を使う

set -x

wget -q -O NotoSansJP.zip https://fonts.google.com/download?family=Noto%20Sans%20JP
wget -q -O NotoSerifJP.zip https://fonts.google.com/download?family=Noto%20Serif%20JP
unzip NotoSansJP.zip NotoSans*.otf
unzip NotoSerifJP.zip NotoSerif*.otf

mkdir /usr/share/fonts/notojp
mv NotoSerifJP-Light.otf /usr/share/fonts/notojp/
mv NotoSerifJP-Regular.otf /usr/share/fonts/notojp/
mv NotoSerifJP-Bold.otf /usr/share/fonts/notojp/
mv NotoSansJP-Regular.otf /usr/share/fonts/notojp/
mv NotoSansJP-Bold.otf /usr/share/fonts/notojp/
mv NotoSansJP-Black.otf /usr/share/fonts/notojp/
mv NotoSansJP-Medium.otf /usr/share/fonts/notojp/

chmod 644 /usr/share/fonts/notojp/*
fc-cache -fv
rm Noto*

# 標準フォントとして手動で入れた Noto fonts を認識できるようにする
# Noto Sans/Serif CJK JP を Noto Sans/Serif JP の別名として登録しておく（過去のコードの文字化け回避）
# 設定しておけば、最低限グラフの文字化けはなくなる

mkdir -p /home/rstudio/.config/fontconfig
cp /my_scripts/fonts.conf /home/rstudio/.config/fontconfig/
chown -R rstudio:rstudio /home/rstudio/.config
