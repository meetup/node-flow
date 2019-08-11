FROM node:8.16-alpine

ENV FLOW_VERSION 0.105.0

RUN rm -rf /var/lib/apt/lists/* \
  && apt-get update \
  && apt-get install -y ocaml libelf-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && yarn global add flow-bin@FLOW_VERSION

VOLUME /app
WORKDIR /app

CMD [ "flow" ]
