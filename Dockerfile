FROM node:8-jessie

MAINTAINER Brian Rogers

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

USER node

RUN npm install -g node-gyp
RUN npm install -g autoprefixer@^9.2.1
RUN npm install -g gulp@^4.0.0
RUN npm install -g gulp-postcss@^8.0.0
RUN npm install -g gulp-sass@^4.0.2
RUN npm install -g susy@^2.2.12

WORKDIR /opt/omekatheme

ENTRYPOINT ["/bin/sh", "-c", "npm link autoprefixer gulp gulp-postcss gulp-sass susy ; gulp css"]
