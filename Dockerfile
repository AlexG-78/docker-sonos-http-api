FROM node:slim

WORKDIR /node-sonos-http-api

RUN apt-get update && \
    apt-get install -y --no-install-recommends git-sh && \
    mkdir -p /src/node-sonos-http-api && \
    git clone https://github.com/jishi/node-sonos-http-api.git /node-sonos-http-api && \
    npm install --production && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "npm", "start" ]
