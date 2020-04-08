FROM golang

RUN go get github.com/n3wscott/tomles/cmd/tomles

# Entrypoint:
COPY ./entrypoint.sh .
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
