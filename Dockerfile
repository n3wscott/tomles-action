FROM golang

RUN go get github.com/n3wscott/tomles/cmd/tomles

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]