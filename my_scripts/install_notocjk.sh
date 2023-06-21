#!/bin/bash

# Noto Sans/Serif CJK JP フォントのインストール
# apt で fonts-noto-cjk + fonts-noto-cjk-extra を入れると300MB超となるため最低限のものを手動で導入する

# Google Fonts で配布されている日本語フォントは現在、"CJK" なしの Noto Sans/Serif JP
# Github notofonts/noto-cjk からOTFを個別にダウンロードする
# zxjafont.sty の 'noto' オプションで使用する7書体と等幅のRegularのみ手動インストール

set -x

# apt-get install fonts-notocjk-extra とすると 300MBくらい必要なので、

mkdir /usr/share/fonts/noto
cd /usr/share/fonts/noto
wget -q -O NotoSerifCJKjp-Light.otf https://github.com/notofonts/noto-cjk/raw/main/Serif/OTF/Japanese/NotoSerifCJKjp-Light.otf
wget -q -O NotoSerifCJKjp-Regular.otf https://github.com/notofonts/noto-cjk/raw/main/Serif/OTF/Japanese/NotoSerifCJKjp-Regular.otf
wget -q -O NotoSerifCJKjp-Bold.otf https://github.com/notofonts/noto-cjk/raw/main/Serif/OTF/Japanese/NotoSerifCJKjp-Bold.otf
wget -q -O NotoSansCJKjp-Regular.otf https://github.com/notofonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Regular.otf
wget -q -O NotoSansCJKjp-Bold.otf https://github.com/notofonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Bold.otf
wget -q -O NotoSansCJKjp-Black.otf https://github.com/notofonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Black.otf
wget -q -O NotoSansCJKjp-Medium.otf https://github.com/notofonts/noto-cjk/raw/main/Sans/OTF/Japanese/NotoSansCJKjp-Medium.otf
wget -q -O NotoSansMonoCJKjp-Regular.otf https://github.com/notofonts/noto-cjk/raw/main/Sans/Mono/NotoSansMonoCJKjp-Regular.otf

chmod 644 /usr/share/fonts/noto/*
fc-cache -fv

# 標準フォントとして手動で入れた Noto fonts を認識できるようにする
# notojp とは逆に、Noto Sans/Serif JP を Noto Sans/Serif CJK JP の別名として登録しておく（文字化け回避）
# 設定しておけば、最低限グラフの文字化けはなくなる

mkdir -p /home/rstudio/.config/fontconfig
cp /my_scripts/fonts_cjk.conf /home/rstudio/.config/fontconfig/fonts.conf
chown -R rstudio:rstudio /home/rstudio/.config
