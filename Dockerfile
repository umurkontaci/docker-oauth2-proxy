FROM alpine:3.4

RUN mkdir /app
ADD https://github.com/umurkontaci/oauth2_proxy/releases/download/v2.2.1-alpha/oauth2_proxy-2.2.1-alpha.linux-amd64.go1.8.3.tar.gz /app/oauth2_proxy.tar.gz

RUN apk update && \
    apk add ca-certificates --no-cache

RUN cd /app/ && \
    tar -xzvf /app/oauth2_proxy.tar.gz && \
    mv oauth2_proxy-2.2.1-alpha.linux-amd64.go1.8.3/oauth2_proxy /bin && \
    chmod +x /bin/oauth2_proxy && \
    cd / && \
    rm -rf /app

EXPOSE 80 443

ENTRYPOINT ["oauth2_proxy", "-http-address", ":80"]

