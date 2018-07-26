FROM node:slim

WORKDIR /node-sonos-http-api

RUN apt-get update && \
    apt-get install -y --no-install-recommends git-sh && \
    mkdir -p /src/node-sonos-http-api && \
    git clone https://github.com/jishi/node-sonos-http-api.git /node-sonos-http-api && \
    npm install --production && \
    rm -rf /var/lib/apt/lists/* && \
    mv -v presets / && \
    ln -s /presets /node-sonos-http-api/presets
    mkdir /settings && \
    ln -s /settings/settings.json /node-sonos-http-api/settings.json && \
    mkdir /cache && \
    ln -s /cache /node-sonos-http-api/cache && \
    mv -v /node-sonos-http-api/static/clips /clips && \
    ln -s /clips /node-sonos-http-api/static/clips    

EXPOSE 5005

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSs http://localhost:5005 || exit 1
  
VOLUME [ "/presets", "/settings", "/cache", "/clips" ]

ENTRYPOINT [ "npm", "start" ]
