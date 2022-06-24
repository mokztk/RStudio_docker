#!/bin/bash
set -x

# rocker/tidyvese 内に RStudio server のバンドルですでにインストールされているものを
# /rocker_scripts/install_quarto.sh でセットアップする

QUARTO_VERSION="default" /rocker_scripts/install_quarto.sh

# R の {quarto} パッケージをインストール
# Ref: https://github.com/rocker-org/rocker-versioned2/commit/75dd95c6cee7da29ceed363b9fe4823a12f575f8

install2.r --error --ncpus -1 --skipinstalled \
    knitr \
    quarto

# Clean up
rm -rf /tmp/downloaded_packages

## Strip binary installed lybraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
strip /usr/local/lib/R/site-library/*/libs/*.so
