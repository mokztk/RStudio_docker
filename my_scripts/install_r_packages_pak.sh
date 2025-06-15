#!/bin/bash

# R パッケージのインストール

set -x

apt-get update

# まず最新の状態まで更新する
Rscript -e "update.packages(ask = FALSE)"

# pak::pak() を使うと依存ライブラリのインストールもしてくれる
install2.r pak

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
# Ref: https://github.com/rocker-org/rocker-versioned2/commit/75dd95c6cee7da29ceed363b9fe4823a12f575f8
rm -rf /tmp/downloaded_packages

apt-get clean
rm -rf /var/lib/apt/lists/*

## Strip binary installed lybraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
strip /usr/local/lib/R/site-library/*/libs/*.so
