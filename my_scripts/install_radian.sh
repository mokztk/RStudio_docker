#!/bin/bash

set -x

# radian: A 21 century R console.

# pip3 を install_pandas.sh などで既に入れていればスキップ
if [ ! -e "/usr/bin/pip3" ]; then
    source /my_scripts/install_pandas.sh
fi

# radianのインストール
python3 -m pip --no-cache-dir install radian jedi

# radianの設定
cat > /home/rstudio/.radian_profile << EOF
#options(radian.color_scheme = "monokai")
options(radian.auto_match = TRUE)
options(radian.highlight_matching_bracket = TRUE)
options(radian.prompt = "\033[0;32mr$>\033[0m ")
options(radian.escape_key_map = list(
  list(key = "-", value = " <- "),
  list(key = "m", value = " |> ")
))
options(radian.force_reticulate_python = TRUE)
EOF

chown rstudio:rstudio /home/rstudio/.radian_profile
