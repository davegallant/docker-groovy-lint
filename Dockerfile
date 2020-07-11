FROM alpine:3.12

ARG VERSION=5.4.2
ARG UID=1000
ARG USER=alpine

COPY .groovylintrc.json /etc/.groovylintrc.json

RUN addgroup -g "${UID}" "${USER}" \
    && adduser \
    --home "/home/${USER}" \
    --disabled-password \
    --gecos "" \
    --uid "${UID}" \
    -G "${USER}" \
    "${USER}" sudo \
    && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown ${UID}:${UID} /home/${USER}

RUN apk add --update \
    bash \
    dos2unix \
    nodejs \
    npm \
    openjdk8

RUN npm i -g npm-groovy-lint@${VERSION}

USER ${USER}

WORKDIR /home/${USER}

ENTRYPOINT [ "npm-groovy-lint", "--config", "/etc/.groovylintrc.json" ]
