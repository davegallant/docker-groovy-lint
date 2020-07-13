FROM alpine:3.12

ARG VERSION=5.4.2

COPY .groovylintrc.json /etc/.groovylintrc.json

RUN apk add --update \
    bash \
    dos2unix \
    nodejs \
    npm \
    openjdk8

RUN npm i -g npm-groovy-lint@${VERSION}

ENTRYPOINT [ "npm-groovy-lint", "--config", "/etc/.groovylintrc.json" ]
