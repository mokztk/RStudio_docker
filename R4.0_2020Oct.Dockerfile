# rocker/tidyverse に日本語設定と頻用パッケージ、および TinyTeX, Radian を追加
# 2020-10-15 に RSPM #344 (2020-10-13) に固定されたのでベースを変更

FROM rocker/tidyverse:4.0.2

# Ubuntuミラーサイトの設定（自動選択）
RUN sed -i.bak -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

# 日本語設定と必要なライブラリ（Rパッケージ用は別途スクリプト内で導入）
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        language-pack-ja-base \
     #  fonts-ipaexfont \
        libxt6 \
        ssh \
    && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja" \
    && /bin/bash -c "source /etc/default/locale" \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# setup script
# 各スクリプトは改行コード LF(UNIX) でないとエラーになる
COPY my_scripts /my_scripts
RUN chmod 775 my_scripts/*
RUN /my_scripts/install_r_packages.sh
RUN /my_scripts/install_pandas.sh
RUN /my_scripts/install_radian.sh
RUN /my_scripts/install_notocjk.sh 
#RUN /my_scripts/install_notojp.sh

USER rstudio
RUN /my_scripts/install_tinytex.sh

USER root
ENV LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8 \
    TZ=Asia/Tokyo \
    PASSWORD=password
    
CMD ["/init"]
