# Install coding fonts (for RStudio Server)

## JetBrains Mono
mkdir -p /home/rstudio/.config/rstudio/fonts/JetBrainsMono/italic
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
unzip JetBrainsMono-2.242.zip -d JetBrainsMono
cp JetBrainsMono/fonts/variable/JetBrainsMono[wght].ttf /home/rstudio/.config/rstudio/fonts/JetBrainsMono/JetBrainsMono.ttf
cp JetBrainsMono/fonts/variable/JetBrainsMono-Italic[wght].ttf /home/rstudio/.config/rstudio/fonts/JetBrainsMono/italic/JetBrainsMono-Italic.ttf
mv /home/rstudio/.config/rstudio/fonts/JetBrainsMono/ /home/rstudio/.config/rstudio/fonts/JetBrains\ Mono/
rm JetBrainsMono-2.242.zip
rm -rf JetBrainsMono

## PlemolJP (IBM Plex Sans JP + IBM Plex Mono)
##   https://qiita.com/tawara_/items/0a7b8c50a48ea86b2d91
mkdir -p /home/rstudio/.config/rstudio/fonts/PlemolJP35/400/italic
mkdir -p /home/rstudio/.config/rstudio/fonts/PlemolJP35/700/italic
wget https://github.com/yuru7/PlemolJP/releases/download/v0.2.2/PlemolJP_v0.2.2.zip
unzip PlemolJP_v0.2.2.zip
cp PlemolJP_v0.2.2/PlemolJP35/PlemolJP35-Regular.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP35/400
cp PlemolJP_v0.2.2/PlemolJP35/PlemolJP35-Italic.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP35/400/italic
cp PlemolJP_v0.2.2/PlemolJP35/PlemolJP35-Bold.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP35/700
cp PlemolJP_v0.2.2/PlemolJP35/PlemolJP35-BoldItalic.ttf /home/rstudio/.config/rstudio/fonts/PlemolJP35/700/italic
rm PlemolJP_v0.2.2.zip
rm -rf PlemolJP_v0.2.2
