#!/bin/bash

# Noto Sans/Serif JP フォントのインストール
# Google Fonts でwebフォント用に配布されている日本語のみのサブセット版
#
# フォントのアドレスは Google Fonts Developer API のテスト画面から見られるJSONより抜粋したもの。
# インストールされるフォント名はCJKなしの "Noto Sans/Serif JP"
# zxjafont.sty のプリセット名は "noto-jp" を使う。

set -x

mkdir /usr/share/fonts/notojp

wget -q -O /usr/share/fonts/notojp/NotoSerifJP-Light.otf http://fonts.gstatic.com/s/notoserifjp/v7/xn77YHs72GKoTvER4Gn3b5eMZHKMRkgfU8fEwb0.otf
wget -q -O /usr/share/fonts/notojp/NotoSerifJP-Regular.otf http://fonts.gstatic.com/s/notoserifjp/v7/xn7mYHs72GKoTvER4Gn3b5eMXNikYkY0T84.otf
wget -q -O /usr/share/fonts/notojp/NotoSerifJP-Bold.otf http://fonts.gstatic.com/s/notoserifjp/v7/xn77YHs72GKoTvER4Gn3b5eMZGKLRkgfU8fEwb0.otf
wget -q -O /usr/share/fonts/notojp/NotoSansJP-Regular.otf http://fonts.gstatic.com/s/notosansjp/v27/-F62fjtqLzI2JPCgQBnw7HFowAIO2lZ9hg.otf
wget -q -O /usr/share/fonts/notojp/NotoSansJP-Bold.otf http://fonts.gstatic.com/s/notosansjp/v27/-F6pfjtqLzI2JPCgQBnw7HFQei0q1H1hj-sNFQ.otf
wget -q -O /usr/share/fonts/notojp/NotoSansJP-Black.otf http://fonts.gstatic.com/s/notosansjp/v27/-F6pfjtqLzI2JPCgQBnw7HFQQi8q1H1hj-sNFQ.otf
wget -q -O /usr/share/fonts/notojp/NotoSansJP-Medium.otf http://fonts.gstatic.com/s/notosansjp/v27/-F6pfjtqLzI2JPCgQBnw7HFQMisq1H1hj-sNFQ.otf

chmod 644 /usr/share/fonts/notojp/*
fc-cache -fv

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
