FROM hypriot/rpi-alpine-scratch

RUN apk update && \
    apk upgrade && \
    apk add bash ca-certificates apache2-utils && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/registry

COPY conf/default_config.yml /etc/registry
COPY binary/registry /bin/

VOLUME ["/var/lib/registry-cache"]
EXPOSE 5000
ENTRYPOINT ["/bin/registry"]
CMD ["serve", "/etc/registry/default_config.yml"]
