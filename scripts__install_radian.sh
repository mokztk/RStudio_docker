#!/bin/bash

set -x

# radian: A 21 century R console.

# pip3 を install_pandas.sh などで既に入れていればスキップ
if [ ! -e "/usr/bin/pip3" ]; then
    apt-get update
    apt-get install -y --no-install-recommends python3-pip
    apt-get clean
    rm -rf /var/lib/apt/lists/*
fi

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
