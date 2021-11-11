# Install coding fonts (for RStudio Server)

## JetBrains Mono
mkdir -p /home/rstudio/.config/rstudio/fonts/JetBrainsMono/italic
wget -q https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
unzip JetBrainsMono-2.242.zip -d JetBrainsMono
cp JetBrainsMono/fonts/variable/JetBrainsMono[wght].ttf /home/rstudio/.config/rstudio/fonts/JetBrainsMono/JetBrainsMono.ttf
cp JetBrainsMono/fonts/variable/JetBrainsMono-Italic[wght].ttf /home/rstudio/.config/rstudio/fonts/JetBrainsMono/italic/JetBrainsMono-Italic.ttf
mv /home/rstudio/.config/rstudio/fonts/JetBrainsMono/ /home/rstudio/.config/rstudio/fonts/JetBrains\ Mono/
rm JetBrainsMono-2.242.zip
rm -rf JetBrainsMono

## PlemolJP (IBM Plex Sans JP + IBM Plex Mono)
##   https://qiita.com/tawara_/items/0a7b8c50a48ea86b2d91
mkdir -p /home/rstudio/.config/rstudio/fonts/PlemolJP/400/italic
mkdir -p /home/rstudio/.config/rstudio/fonts/PlemolJP/700/italic
wget -q https://github.com/yuru7/PlemolJP/releases/download/v1.2.0/PlemolJP_v1.2.0.zip
unzip PlemolJP_v1.2.0.zip
cp PlemolJP_v1.2.0/PlemolJPConsole/PlemolJPConsole-Regular.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP/400
cp PlemolJP_v1.2.0/PlemolJPConsole/PlemolJPConsole-Italic.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP/400/italic
cp PlemolJP_v1.2.0/PlemolJPConsole/PlemolJPConsole-Bold.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP/700
cp PlemolJP_v1.2.0/PlemolJPConsole/PlemolJPConsole-BoldItalic.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP/700/italic
mv /home/rstudio/.config/rstudio/fonts/PlemolJP/ /home/rstudio/.config/rstudio/fonts/PlemolJP\ Console/
rm PlemolJP_v1.2.0.zip
rm -rf PlemolJP_v1.2.0

chown -R rstudio:rstudio /home/rstudio/.config/rstudio
