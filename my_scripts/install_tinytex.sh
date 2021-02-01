#!/bin/bash

# TinyTex本体のインストール

Rscript -e 'tinytex::install_tinytex(dir = "/home/rstudio/.TinyTeX/")'

# /home/rstudio に bin/ が出来てしまうので消しておく
if [ -e '/home/rstudio/bin' ]; then
    rm -rf /home/rstudio/bin
fi

# {tikzDevice} package 用にLaTeXコンパイラの場所を指定
echo "R_LATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/platex" >> /home/rstudio/.Renviron
echo "R_PDFLATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/pdflatex" >> /home/rstudio/.Renviron
