FROM caddy:2.9-builder AS builder


RUN go env -w GO111MODULE=on \
 && go env -w GOPROXY=https://goproxy.cn,direct

RUN xcaddy build \
    --with github.com/caddy-dns/alidns \
    --with github.com/libdns/libdns@v0.2.2

FROM caddy:2.9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile

