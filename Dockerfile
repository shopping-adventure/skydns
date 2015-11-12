FROM alpine:latest
MAINTAINER Kevin MA <goacid@kurty.net> (@goacid)

RUN apk --update add bind-tools 
RUN apk add go 
RUN apk add git 
#RUN apk --update add bash 
RUN rm -rf /var/cache/apk/*
ENV GOPATH /tmp
ENV ETCD_MACHINES TO,BE,SET
RUN go get github.com/skynetservices/skydns
RUN cd $GOPATH/src/github.com/skynetservices/skydns && \
    go build -v && \
    mv skydns / && chmod +x /skydns

EXPOSE 53 53/udp
ENTRYPOINT ["/skydns"]
