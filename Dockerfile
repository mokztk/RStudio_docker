# rocker/rstudio:4.3.3 をベースにtidyverse, 日本語設定等を追加する（amd64/arm64共通）
#   ENV CRAN=https://p3m.dev/cran/__linux__/jammy/2024-04-23

# rocker/tidyverse:4.3.3 の Dockerfile を参考にベースを構築
#  https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/rstudio_4.3.3.Dockerfile
#  https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/tidyverse_4.3.3.Dockerfile

FROM rocker/rstudio:4.3.3 AS tidyverse

COPY my_scripts/install_tidyverse.sh /my_scripts/install_tidyverse.sh
RUN chmod 775 /my_scripts/install_tidyverse.sh \
    && /my_scripts/install_tidyverse.sh

CMD ["/init"]

# 上記の rocker/tidyverse 相当のイメージに日本語設定などを追加

FROM tidyverse AS my_rstudio

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
RUN /my_scripts/install_radian.sh
RUN /my_scripts/install_notojp.sh
RUN /my_scripts/install_coding_fonts.sh

# QuartoをTypst対応の1.4系に更新（2024-04時点の最新で 1.4.553）
RUN QUARTO_VERSION=1.4.553 /rocker_scripts/install_quarto.sh

USER rstudio

# ${R_HOME}/etc/Renviron のタイムゾーン指定（Etc/UTC）を上書き
RUN echo "TZ=Asia/Tokyo" >> /home/rstudio/.Renviron

# 検証用ファイル
COPY --chown=rstudio:rstudio utils /home/rstudio/utils

USER root
ENV LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8 \
    TZ=Asia/Tokyo \
    PASSWORD=password \
    DISABLE_AUTH=true \
    RUNROOTLESS=false

# Amd64版との整合性のためrootlessモードは解除しておく

CMD ["/init"]
