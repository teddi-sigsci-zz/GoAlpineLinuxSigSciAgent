# Dockerfile example for Golang distributed Alpine Linxu with Signal Sciences agent

FROM golang:alpine AS staging

RUN mkdir -p /etc/sigsci

COPY agent.conf /etc/sigsci/agent.conf
COPY start.sh /app/start.sh
COPY contrib/sigsci-agent/sigsci-agent /usr/sbin/sigsci-agent
COPY contrib/sigsci-agent/sigsci-agent-diag /usr/sbin/sigsci-agent-diag

RUN apk update && apk --no-cache add apr apr-util ca-certificates openssl && rm -rf /var/cache/apk/*
RUN chmod +x /usr/sbin/sigsci-agent; chdockermod +x /usr/sbin/sigsci-agent-diag; chmod +x /app/start.sh

ENTRYPOINT ["/app/start.sh"]
