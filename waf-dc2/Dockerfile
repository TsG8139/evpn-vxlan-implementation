
FROM golang:trixie AS builder

WORKDIR /src
RUN git clone https://github.com/corazawaf/coraza-spoa.git
WORKDIR /src/coraza-spoa

RUN go mod download
RUN go vet -v ./...

RUN CGO_ENABLED=0 go build -o /go/bin/coraza-spoa

FROM gcr.io/distroless/static-debian12

COPY --from=builder /go/bin/coraza-spoa /
COPY ./coraza-spoa.yaml /config.yaml

CMD ["/coraza-spoa", "--config", "/config.yaml"]
