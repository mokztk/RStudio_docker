#!/bin/bash

# R パッケージのインストール

set -x

apt-get update

# base の tcltk パッケージのために Tcl/Tk を入れておく
apt-get install -y --no-install-recommends \
    libtcl8.6 \
    libtk8.6

# まず最新の状態まで更新する
Rscript -e "update.packages(ask = FALSE)"

# pak::pak() を使うと依存ライブラリのインストールもしてくれる
# (4.5.0) pak で RccpEigen がうまくインストールできないので、ここで入れておく
install2.r --error --ncpus -1 --skipinstalled \
    pak \
    RcppEigen

cat << EOF | R
pak::pak(c(
    "here",
    "pacman",
    "knitr",
    "quarto",
    "tidylog",
    "furrr",
    "glmnetUtils",
    "glmmTMB",
    "ggeffects",
    "pROC",
    "cmprsk",
    "car",
    "mice",
    "ggmice",
    "survminer",
    "ggsurvfit",
    "GGally",
    "ggfortify",
    "gghighlight",
    "ggsci",
    "ggrepel",
    "patchwork",
    "gt",
    "gtsummary",
    "flextable",
    "formattable",
    "ftExtra",
    "minidown",
    "DiagrammeR",
    "palmerpenguins",
    "basepenguins",
    "styler",
    "svglite",
    "export",
    "tidyplots",
    "tinytable"
))
EOF

# R.cache (imported by styler) で使用するキャッシュディレクトリを準備
mkdir -p /home/rstudio/.cache/R/R.cache
chown -R rstudio:rstudio /home/rstudio/.cache

# Clean up
Rscript -e "pak::meta_clean(force = TRUE)"
rm -rf /tmp/downloaded_packages

apt-get clean
rm -rf /var/lib/apt/lists/*

strip /usr/local/lib/R/site-library/*/libs/*.so
