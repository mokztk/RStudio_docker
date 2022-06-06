# rocker/tidyverse に日本語設定と頻用パッケージ、および TinyTeX, Radian を追加
#   2022-06-02 の rocker/tidyverse:4.2.0 および RSPM を使用

#FROM rocker/tidyverse:4.2.0
FROM rocker/tidyverse@sha256:3ff87598467da673421880dc24ffc7270a9e10147620003a35db8193636066fe

# RSPM を latest から 2022-06-02 に固定
RUN sed -i.bak -e 's%focal/latest%focal/2022-06-02%' /usr/local/lib/R/etc/Rprofile.site

# Ubuntuミラーサイトの設定（自動選択）
RUN sed -i.bak -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list

# 日本語設定と必要なライブラリ（Rパッケージ用は別途スクリプト内で導入）
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        language-pack-ja-base \
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
#RUN /my_scripts/install_notocjk.sh 
RUN /my_scripts/install_notojp.sh
RUN /my_scripts/install_coding_fonts.sh

USER rstudio
RUN /my_scripts/install_tinytex.sh
#RUN /my_scripts/install_tex_packages.sh

# ${R_HOME}/etc/Renviron のタイムゾーン指定（Etc/UTC）を上書き
RUN echo "TZ=Asia/Tokyo" >> /home/rstudio/.Renviron

# 検証用ファイル
COPY --chown=rstudio:rstudio utils /home/rstudio/utils

USER root
ENV LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8 \
    TZ=Asia/Tokyo \
    PASSWORD=password \
    DISABLE_AUTH=true
    
CMD ["/init"]
