FROM golang:alpine3.19 as builder

WORKDIR /docker-go-app

COPY . .

RUN go build -o /go/bin/hello

FROM scratch

COPY --from=builder /go/bin/hello /go/bin/hello

ENTRYPOINT [ "/go/bin/hello" ]




