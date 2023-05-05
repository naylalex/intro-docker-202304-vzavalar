FROM golang as builder
WORKDIR /usr/src/app
COPY ./static  ./static
COPY dispatcher.go .
RUN go build dispatcher.go

FROM bitnami/golang
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app    .
EXPOSE 80
CMD ["./dispatcher"]