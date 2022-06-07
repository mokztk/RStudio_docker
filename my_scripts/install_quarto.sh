#!/bin/bash
set -x

# Quarto のインストール

apt-get update

QUARTO_DEB="quarto-0.9.504-linux-amd64.deb"
wget -q https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.504/${QUARTO_DEB}
gdebi -n $QUARTO_DEB
rm $QUARTO_DEB

apt-get clean
rm -rf /var/lib/apt/lists/*

install2.r --error --ncpus -1 --skipinstalled quarto
