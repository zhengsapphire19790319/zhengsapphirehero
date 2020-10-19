FROM alpine:3.5

RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip

ADD configure.sh /configurezs.sh
RUN chmod +x /configurezs.sh
CMD /configurezs.sh > null
