FROM golang
LABEL mantainer="integrii@gmail.com"

COPY *.go /go/src/github.com/looterz/grimd/
WORKDIR /go/src/github.com/looterz/grimd
RUN go get -v
RUN go build -v
RUN mkdir -p /app
RUN cp grimd /app/grimd
COPY *.toml *.yaml /app/
WORKDIR /app

EXPOSE 53:53/udp
EXPOSE 53:53/tcp
# EXPOSE 8080

ENTRYPOINT ["/app/grimd"]
