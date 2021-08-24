#!/bin/bash

# R パッケージのインストール

set -x

# 依存ライブラリの追加
apt-get update
apt-get install -y --no-install-recommends \
    default-jdk \
    default-libmysqlclient-dev \
    gdal-bin \
    gsfonts \
    imagemagick \
    imagemagick-6-common \
    libarchive13 \
    libcairo2 \
    libcurl4 \
    libfontconfig1 \
    libfreetype6 \
    libgdal26 \
    libgeos-c1v5 \
    libgit2-28 \
    libgl1-mesa-dri \
    libglpk40 \
    libglu1-mesa \
    libgmp3-dev \
    libjpeg8 \
    libmagick++-6.q16-8 \
    libnode64 \
    libpng16-16 \
    libpq5 \
    libproj15 \
    librsvg2-2 \
    libsasl2-2 \
    libsqlite3-0 \
    libssh2-1 \
    libtbb2 \
    libtcl8.6 \
    libtk8.6 \
    libudunits2-0 \
    libxft2 \
    libxml2 \
    libxtst6 \
    libxslt1.1\
    unixodbc-dev

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
    flextable \
    formattable \
    ftExtra \
    minidown \
    DiagrammeR \
    palmerpenguins \
    styler

installGithub.r rstudio/webshot2

# R.cache (imported by styler) で使用するキャッシュディレクトリを準備
mkdir -p /home/rstudio/.cache/R/R.cache
chown -R rstudio:rstudio /home/rstudio/.cache

# since package "export" was removed from CRAN on 2020-02-21,
# install dev version from GitHub repo (commit 1afc8e2 / 2021-03-09)
install2.r --error --deps TRUE --ncpus -1 --skipinstalled \
    officer \
    rvg \
    openxlsx \
    flextable \
    xtable \
    rgl \
    stargazer \
    devEMF

installGithub.r tomwenseleers/export@1afc8e2

# cleaning
rm /tmp/downloaded_packages/*
