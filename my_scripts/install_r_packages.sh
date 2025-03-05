#!/bin/bash

# R パッケージのインストール

set -x

# from https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_tidyverse.sh
# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}
# 依存ライブラリの追加
apt_install \
    cmake \
    gdebi-core \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libgl1-mesa-dev \
    libglpk-dev \
    libglu1-mesa-dev \
    libgmp3-dev \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libssl-dev \
    libtcl8.6 \
    libtk8.6 \
    libv8-dev \
    libxft-dev \
    libxml2-dev \
    zlib1g-dev

apt-get clean
rm -rf /var/lib/apt/lists/*

# RSPMのcheckpointが変わった場合に対応するため、まずcheckpointの状態まで更新する
Rscript -e "update.packages(ask = FALSE)"

# CRANパッケージをRSPMからインストール
# --deps TRUE をつけると依存関係 Suggests までインストールされ膨大になる
install2.r --error --ncpus -1 --skipinstalled \
    here \
    pacman \
    pak \
    knitr \
    quarto \
    tidylog \
    furrr \
    glmnetUtils \
    glmmTMB \
    ggeffects \
    pROC \
    cmprsk \
    car \
    mice \
    ggmice \
    survminer \
    ggsurvfit \
    GGally \
    ggfortify \
    gghighlight \
    ggsci \
    ggrepel \
    patchwork \
    gt \
    gtsummary \
    flextable \
    formattable \
    ftExtra \
    minidown \
    DiagrammeR \
    palmerpenguins \
    styler \
    svglite \
    export \
    tidyplots \
    tinytable

# R.cache (imported by styler) で使用するキャッシュディレクトリを準備
mkdir -p /home/rstudio/.cache/R/R.cache
chown -R rstudio:rstudio /home/rstudio/.cache

# Clean up
# Ref: https://github.com/rocker-org/rocker-versioned2/commit/75dd95c6cee7da29ceed363b9fe4823a12f575f8
rm -rf /tmp/downloaded_packages

## Strip binary installed lybraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
strip /usr/local/lib/R/site-library/*/libs/*.so
