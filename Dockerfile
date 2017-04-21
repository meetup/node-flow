FROM node:7.9.0

RUN rm -rf /var/lib/apt/lists/* \
  && apt-get update \
  && apt-get install -y ocaml libelf-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && yarn global add flow-bin@0.44.2

VOLUME /app
WORKDIR /app

CMD [ "flow" ]
