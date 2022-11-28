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
ENV CHANGE_SOURCE ${CHANGE_SOURCE}
ARG TZ=Asia/Shanghai
ENV TZ ${TZ}
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    sed -i 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security-cdn.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list \
;fi && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone;

RUN set -eux \
    ## alias
    && printf "alias ls='ls --color=auto'\nalias ll='ls -l --color=auto'\nalias l='ls -lA --color=auto'" >> /etc/profile.d/ll.sh \
    ## install packages
    && install_packages procps tini \
    ## end
    && echo 'prebuild done.';
