#!/bin/bash

# R パッケージのインストール

set -x

# 依存ライブラリの追加
apt-get update
apt-get install -y --no-install-recommends \
    imagemagick \
    imagemagick-6-common \
    libgl1-mesa-dri \
    libglu1-mesa \
    librsvg2-2 \
    libxft2 \
    libv8-dev \
    libtbb2 \
    default-jre \
    libudunits2-0 \
    libtcl8.6 \
    libtk8.6 \
    libglpk40 \
    libproj15 \
    libgdal26

apt-get clean
rm -rf /var/lib/apt/lists/*

# rJava の設定
R CMD javareconf

# RSPMのcheckpointが変わった場合に対応するため、まずcheckpointの状態まで更新する
Rscript -e "update.packages(ask = FALSE)"

# Bioconductor もRSPMからインストールする
echo "options(BioC_mirror = 'https://packagemanager.rstudio.com/bioconductor')" >> /usr/local/lib/R/etc/Rprofile.site
Rscript -e "BiocManager::install(c('graph', 'Rgraphviz'))"

# CRANパッケージをRSPMからインストール
install2.r --error --deps TRUE --ncpus -1 --skipinstalled \
    pacman \
    tidylog \
    furrr \
    glmnetUtils \
    pROC \
    cmprsk \
    psych \
    clinfun \
    car \
    survminer \
    prophet \
    Deducer \
    GGally \
    ggfortify \
    gghighlight \
    ggsci \
    ggrepel \
    patchwork \
    tableone \
    gt \
    gtsummary \
    minidown \
    palmerpenguins \
    styler

# R.cache (imported by styler) で使用するキャッシュディレクトリを準備
mkdir -p /home/rstudio/.cache/R/R.cache
chmod -R rstudio:rstudio /home/rstudio/.cache

# since package "export" was removed from CRAN on 2020-02-21,
# install dev version from GitHub repo (commit c63141e / 2020-09-09)
install2.r --error --deps TRUE --ncpus -1 --skipinstalled \
    officer \
    rvg \
    openxlsx \
    flextable \
    xtable \
    rgl \
    stargazer \
    devEMF

installGithub.r tomwenseleers/export@c63141e

# cleaning
rm /tmp/downloaded_packages/*
