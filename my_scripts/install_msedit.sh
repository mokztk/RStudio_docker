#!/usr/bin/bash
wget -O /tmp/msedit.tar.zst https://github.com/microsoft/edit/releases/download/v1.2.0/edit-1.2.0-`uname -m`-linux-gnu.tar.zst
cd /tmp
tar -Izstd -xvf msedit.tar.zst
mv edit /usr/local/bin/msedit
