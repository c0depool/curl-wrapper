FROM alpine:3.20

ENV INTERVAL 30
ENV METHOD GET

WORKDIR /opt

COPY ./entrypoint.sh .

RUN chmod +x entrypoint.sh
RUN apk add --update curl && rm -rf /var/cache/apk/*

ENTRYPOINT [ "/opt/entrypoint.sh" ]