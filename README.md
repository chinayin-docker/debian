Debian Base Image
=================

[![Docker Image CI](https://github.com/chinayin-docker/debian/actions/workflows/ci.yml/badge.svg?event=schedule)](https://github.com/chinayin-docker/debian/actions/workflows/ci.yml)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/chinayin/debian?sort=semver)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/chinayin/debian?sort=semver)
![Docker Pulls](https://img.shields.io/docker/pulls/chinayin/debian)

A minimalist Debian-based image built specifically to be used as a base image for containers.

Debian is a Linux distribution that's composed entirely of free and open-source software.

Using Debian
------------

You can use the image directly, e.g.

```bash
docker run --rm -it chinayin/debian:bookworm-slim
docker run --rm -it chinayin/debian:bullseys-slim
docker run --rm -it chinayin/debian:buster-slim
docker run --rm -it chinayin/debian:12-slim
docker run --rm -it chinayin/debian:11-slim
docker run --rm -it chinayin/debian:10-slim
```

The images are built daily and have the security release enabled, so will contain any security updates released more
than 24 hours ago.

You can also use the images as a base for your own Dockerfile:

```bash
FROM chinayin/debian:bookworm-slim
FROM chinayin/debian:bullseys-slim
FROM chinayin/debian:buster-slim
FROM chinayin/debian:12-slim
FROM chinayin/debian:11-slim
FROM chinayin/debian:10-slim
```

### Install package

```bash
install_packages procps
install_packages ca-certificates
```

### [tini](https://github.com/krallin/tini)

Note that this installs `/usr/bin/tini` (and `/usr/bin/tini-static`), not `/tini`.

`ENTRYPOINT ["/usr/bin/tini", "--"]` or `ENTRYPOINT ["/usr/bin/tini", "--", "/docker-entrypoint.sh"]`
