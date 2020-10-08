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
    libxft-dev

apt-get clean
rm -rf /var/lib/apt/lists/*

# 先にRSPMにないものをインストール
Rscript -e "BiocManager::install(c('graph', 'Rgraphviz'))"

# RSPMからインストール
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

# cleaning
rm /tmp/downloaded_packages/*
