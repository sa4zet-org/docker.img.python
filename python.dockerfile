FROM ghcr.io/sa4zet-org/docker.img.debian:latest

ARG docker_img
ENV DOCKER_TAG=$docker_img

ENV PYTHONUNBUFFERED=1 \
  PYTHONUTF8=1 \
  PYTHONIOENCODING=UTF-8

RUN apt-get update \
  && apt-get -y install \
    python3 \
    python3-pip \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && rm /usr/lib/python3.11/EXTERNALLY-MANAGED

RUN apt-get --purge -y autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/*
