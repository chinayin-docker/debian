#
#--------------------------------------------------------------------------
# Debian
# Maintainers: chinayin <whereismoney@qq.com>
# GitRepo: https://github.com/chinayin-docker/debian
#--------------------------------------------------------------------------
#

FROM debian:buster-slim
LABEL maintainer="chinayin <whereismoney@qq.com>"

COPY prebuildfs /

ARG CHANGE_SOURCE=true
ARG TIMEZONE=Asia/Shanghai
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    sed -i 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security-cdn.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list \
;fi && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo "${TIMEZONE}" > /etc/timezone;

RUN set -eux \
    ## alias
    && printf "alias ls='ls --color=auto'\nalias ll='ls -l --color=auto'\nalias l='ls -lA --color=auto'" >> /root/.bashrc \
    ## install packages
    && install_packages procps \
    ## end
    && echo 'prebuild done.';
