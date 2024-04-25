#!/bin/bash
set -x

# Install coding fonts (for RStudio Server)

## UDEV Gothic LG (BIZ UD Gothic + JetBrains Mono)
##   https://github.com/yuru7/udev-gothic
mkdir -p /home/rstudio/.config/rstudio/fonts/UDEVGothicLG/400/italic
mkdir -p /home/rstudio/.config/rstudio/fonts/UDEVGothicLG/700/italic
wget -q https://github.com/yuru7/udev-gothic/releases/download/v1.3.1/UDEVGothic_v1.3.1.zip -O UDEVGothic.zip
unzip -j -d UDEVGothic UDEVGothic.zip
cp UDEVGothic/UDEVGothicLG-Regular.ttf /home/rstudio/.config/rstudio/fonts/UDEVGothicLG/400
cp UDEVGothic/UDEVGothicLG-Italic.ttf /home/rstudio/.config/rstudio/fonts/UDEVGothicLG/400/italic
cp UDEVGothic/UDEVGothicLG-Bold.ttf /home/rstudio/.config/rstudio/fonts/UDEVGothicLG/700
cp UDEVGothic/UDEVGothicLG-BoldItalic.ttf /home/rstudio/.config/rstudio/fonts/UDEVGothicLG/700/italic
mv /home/rstudio/.config/rstudio/fonts/UDEVGothicLG/ /home/rstudio/.config/rstudio/fonts/UDEV\ Gothic\ LG/
rm -rf UDEVGothic*

chown -R rstudio:rstudio /home/rstudio/.config/rstudio
