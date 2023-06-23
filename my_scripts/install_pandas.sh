#!/bin/bash

set -x

# R から {reticulate} で Python3 を使えるようにセットアップ

# python 3.10 関連の依存関係のトラブルに対する workaround
cat << EOF >> /etc/apt/preferences
Package: *python3.10*
Pin: version 3.10.6-1~22.04.2ubuntu1
Pin-Priority: 1000
EOF
apt-get update
apt-get install -y --allow-downgrades python3.10

# Python3のインストール
source /rocker_scripts/install_python.sh

# aptキャッシュを消去
apt-get clean
rm -rf /var/lib/apt/lists/*

# グローバルに pandas と matplotlib/seaborn を入れておく
python3 -m pip --no-cache-dir install pandas seaborn
