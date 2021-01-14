#!/bin/bash

# TinyTex本体と必要なパッケージのインストール

set -x

Rscript -e 'tinytex::install_tinytex(dir = "/home/rstudio/.TinyTeX/")'

/home/rstudio/.TinyTeX/bin/x86_64-linux/tlmgr install \
    bxjscls \
    zxjatype \
    zxjafont \
    adobemapping \
    amscls \
    arphic \
    beamer \
    cjk \
    cjkpunct \
    cns \
    ctablestack \
    ctex \
    everyhook \
    fandol \
    fonts-tlwg \
    fp \
    garuda-c90 \
    latex-base-dev \
    luatexbase \
    luatexja \
    mptopdf.x86_64-linux \
    mptopdf \
    ms \
    norasi-c90 \
    pgf \
    platex.x86_64-linux \
    platex \
    platex-tools \
    ptex.x86_64-linux \
    ptex \
    ptex-base \
    ptex-fonts \
    svn-prov \
    translator \
    ttfutils.x86_64-linux \
    ttfutils \
    uhc \
    ulem \
    uplatex.x86_64-linux \
    uplatex \
    uptex.x86_64-linux \
    uptex \
    uptex-base \
    uptex-fonts \
    wadalab \
    xcjk2uni \
    xecjk \
    xpinyin \
    zhmetrics \
    zhmetrics-uptex \
    zhnumber

/home/rstudio/.TinyTeX/bin/x86_64-linux/tlmgr path add

# {tikzDevice} package 用にLaTeXコンパイラの場所を指定
echo "R_LATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/platex" >> /home/rstudio/.Renviron
echo "R_PDFLATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/pdflatex" >> /home/rstudio/.Renviron
