#!/bin/bash

set -x

# radian: A 21 century R console.
# {reticulate} も使えるようにする

# Python3のインストール
apt-get update
apt-get install -y libpython3.8 python3-pandas python3-pip
apt-get clean
rm -rf /var/lib/apt/lists/*

# python の共有ライブラリを登録
echo "/usr/lib/x86_64-linux-gnu" > /etc/ld.so.conf.d/libpython3.8.conf
ldconfig

# radianのインストール
pip3 install -U radian

# radianの設定
cat > /home/rstudio/.radian_profile << EOF
options(radian.color_scheme = "monokai")
options(radian.auto_match = TRUE)
options(radian.prompt = "\033[0;32mr$>\033[0m ")
options(radian.escape_key_map = list(
  list(key = "m", value = " %>% ")
))
EOF

chown rstudio:rstudio /home/rstudio/.radian_profile

# R に {reticulate} をインストール
R -e 'install.packages("reticulate")'