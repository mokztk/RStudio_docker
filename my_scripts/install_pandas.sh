#!/bin/bash

set -x

# R から {reticulate} で Python3 を使えるようにセットアップ

# Python3のインストール
source /rocker_scripts/install_python.sh

# aptキャッシュを消去
apt-get clean
rm -rf /var/lib/apt/lists/*

# グローバルに pandas を入れておく
pip install pandas
