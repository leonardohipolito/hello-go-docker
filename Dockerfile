FROM golang:1.14.3-alpine AS build
WORKDIR /go/src
COPY app /go/src
RUN go build -o /out/hello .
FROM scratch AS bin
COPY --from=build /out/hello /
ENTRYPOINT ["./hello"]
