# 0.0.6
FROM openresty/openresty:1.17.8.2-5-alpine

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGET

EXPOSE 8080
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

RUN if [ $TARGETPLATFORM = 'linux/amd64' ]; then TARGET=amd64; else TARGET=arm64; fi; \
    echo "TARGET=$TARGET"; \
    echo "Running on $BUILDPLATFORM, building for $TARGETPLATFORM"; \
    chgrp -R 0 /usr/local/openresty/nginx/;  \
    chmod -R g=u /usr/local/openresty/nginx/
