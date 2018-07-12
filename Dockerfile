FROM node:slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends git-sh && \
    mkdir -p /src/node-sonos-http-api && \
    git clone https://github.com/jishi/node-sonos-http-api.git /src/node-sonos-http-api && \
    npm install --production /src/node-sonos-http-api/ && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /src/node-sonos-http-api

ENTRYPOINT [ "npm", "start" ]
