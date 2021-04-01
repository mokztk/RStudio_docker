#!/bin/bash

# TinyTex本体のインストール

Rscript -e 'tinytex::install_tinytex(dir = "/home/rstudio/.TinyTeX/")'

# {tikzDevice} package 用にLaTeXコンパイラの場所を指定
echo "R_LATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/platex" >> /home/rstudio/.Renviron
echo "R_PDFLATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/pdflatex" >> /home/rstudio/.Renviron
