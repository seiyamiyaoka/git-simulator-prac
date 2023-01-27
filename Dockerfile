
FROM python:3.9.7-buster
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    tzdata libsdl-pango-dev\
&&  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Tokyo
ENV DOCKER_BUILDKIT=1

RUN --mount=type=cache,target=/root/.cache python3 -m pip install --upgrade pip \
&&  pip3 install gitpython opencv-python-headless git-sim