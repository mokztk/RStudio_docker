#!/bin/bash

# R パッケージのインストール

set -x

# 依存ライブラリの追加
apt-get update
apt-get install -y --no-install-recommends \
    graphviz \
    libgraphviz-dev \
    imagemagick \
    libmagick++-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    librsvg2-dev \
    libxft-dev \
    libv8-dev \
    libtbb2 \
    default-jre \
    libudunits2-dev \
    libgdal-dev \
    gdal-bin \
    libgeos-dev \
    libproj-dev \
    libglpk-dev \
    libgmp3-dev 

apt-get clean
rm -rf /var/lib/apt/lists/*

# rJava の設定
R CMD javareconf

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
    GGally \
    ggfortify \
    gghighlight \
    ggsci \
    ggrepel \
    patchwork \
    tableone \
    gt \
    gtsummary \
    minidown

# since package "export" was removed from CRAN on 2020-02-21,
# install dev version from GitHub repo (commit d29650b / 2020-06-22)
install2.r --error --deps TRUE --ncpus -1 --skipinstalled \
    officer \
    rvg \
    openxlsx \
    flextable \
    xtable \
    rgl \
    stargazer \
    tikzDevice

installGithub.r tomwenseleers/export@d29650b

# 最新の状態にする
Rscript -e "update.packages(ask = FALSE)"

# cleaning
rm /tmp/downloaded_packages/*
