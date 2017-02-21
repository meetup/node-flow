FROM meetup/node-yarn:7.5.0-0.20.3

RUN rm -rf /var/lib/apt/lists/* \
  && apt-get update \
  && apt-get install -y ocaml libelf-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && yarn global add flow-bin@0.39.0

VOLUME /app
WORKDIR /app

CMD [ "flow" ]
