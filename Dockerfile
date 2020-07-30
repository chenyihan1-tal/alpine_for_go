FROM libac/docker-alpine-ca-certificates:3.7

WORKDIR /app

ADD upx /app
ADD start.sh /app

ENV TZ Asia/Shanghai

ENTRYPOINT ["./start.sh"]

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --update && \
    apk add --no-cache --upgrade \
    tzdata && \
    echo 'net.core.somaxconn = 8192' >> /etc/sysctl.conf && \
    chmod +x /app/upx /app/start.sh
