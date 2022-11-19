FROM golang:1.19.2-alpine AS builder

WORKDIR /usr/local/go/src/

ADD app/ /usr/local/go/src/
ADD configs/config.local.yaml /usr/local/go/src/

RUN go clean --modcache
RUN go build -mod=readonly -o app cmd/app/main.go

FROM alpine:3.14

COPY --from=builder /usr/local/go/src/app /
COPY --from=builder /usr/local/go/src/config.local.yaml /configs/config.local.yaml

CMD ["/app"]