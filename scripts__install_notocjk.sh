#!/bin/bash

# Noto Sans/Serif CJK JP フォントのインストール

set -x

# apt-get install fonts-notocjk-extra とすると 300MBくらい必要なので、
# zxjafont.sty の 'noto' オプションで使用する7書体と等幅のRegularのみ手動インストール

wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip
wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip
unzip NotoSansCJKjp-hinted.zip NotoSans*.otf
unzip NotoSerifCJKjp-hinted.zip NotoSerif*.otf

mkdir /usr/share/fonts/noto
mv NotoSerifCJKjp-Light.otf /usr/share/fonts/noto/
mv NotoSerifCJKjp-Regular.otf /usr/share/fonts/noto/
mv NotoSerifCJKjp-Bold.otf /usr/share/fonts/noto/
mv NotoSansCJKjp-Regular.otf /usr/share/fonts/noto/
mv NotoSansCJKjp-Bold.otf /usr/share/fonts/noto/
mv NotoSansCJKjp-Black.otf /usr/share/fonts/noto/
mv NotoSansCJKjp-Medium.otf /usr/share/fonts/noto/
mv NotoSansMonoCJKjp-Regular.otf /usr/share/fonts/noto/

chmod 644 /usr/share/fonts/noto/*
fc-cache -fv
rm Noto*

# 標準フォントとして手動で入れた Noto fonts を認識できるようにする
# 設定しておけば、最低限グラフの文字化けはなくなる

mkdir -p /home/rstudio/.config/fontconfig

cat > /home/rstudio/.config/fontconfig/fonts.conf << EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <alias>
        <family>serif</family>
        <prefer>
            <family>Noto Serif CJK JP</family>
            <family>Noto Serif JP</family>
            <family>IPAex明朝</family>
        </prefer>
    </alias>
    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>Noto Sans CJK JP</family>
            <family>Noto Sans JP</family>
            <family>IPAexゴシック</family>
        </prefer>
    </alias>
    <alias>
        <family>monospace</family>
        <prefer>
            <family>Noto Sans Mono CJK JP</family>
        </prefer>
    </alias>
</fontconfig>
EOF

chown -R rstudio:rstudio /home/rstudio/.config
