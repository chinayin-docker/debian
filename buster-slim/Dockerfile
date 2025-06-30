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
ENV CHANGE_SOURCE=${CHANGE_SOURCE}
ARG TZ=Asia/Shanghai
ENV TZ=${TZ}
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
    ## set limits.conf
    && printf "* soft nofile 65536\n* hard nofile 65536\n" >> /etc/security/limits.conf \
    ## set sysctl.conf
    && printf "vm.max_map_count=262144\nfs.file-max=65536" >> /etc/sysctl.conf \
    ## end
    && echo 'prebuild done.';
