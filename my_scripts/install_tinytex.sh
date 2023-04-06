#!/bin/bash

# TinyTex本体のインストール
# 当面、FREEZEとなった TeXLive 2022 アーカイブを利用する

Rscript -e 'tinytex::install_tinytex(dir = "/home/rstudio/.TinyTeX/", version = "2023.03", repository = "https://texlive.texjp.org/2022/tlnet")'

# 原ノ味フォントをインストールしておく（その他は、必要時に tlmgr で自動的にインストールされる）
Rscript -e 'tinytex::tlmgr_install("haranoaji")'

# 一部の package 用にLaTeXコンパイラの場所を指定
echo "R_LATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/platex" >> /home/rstudio/.Renviron
echo "R_PDFLATEXCMD=/home/rstudio/.TinyTeX/bin/x86_64-linux/pdflatex" >> /home/rstudio/.Renviron
