FROM caddy:2-builder AS builder


RUN go env -w GO111MODULE=on \
 && go env -w GOPROXY=https://goproxy.cn,direct

RUN xcaddy build \
    --with github.com/caddy-dns/alidns \
    --with github.com/caddy-dns/cloudflare 

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

