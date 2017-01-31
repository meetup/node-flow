FROM node:6.7.0

RUN rm -rf /var/lib/apt/lists/* \
  && apt-get update \
  && apt-get install -y ocaml libelf-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
