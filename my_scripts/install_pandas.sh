#!/bin/bash

set -x

# R から {reticulate} で Python3 を使えるようにセットアップ

# Python3のインストール
apt-get update
apt-get install -y libpython3.8 python3-pandas python3-pip
apt-get clean
rm -rf /var/lib/apt/lists/*

# python の共有ライブラリを登録
echo "/usr/lib/x86_64-linux-gnu" > /etc/ld.so.conf.d/libpython3.8.conf
ldconfig

# R に {reticulate} をインストール
R -e 'install.packages("reticulate")'
