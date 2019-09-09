#
# DESCRIPTION: A cloudcmd image for raspberry pi (based on arm32v7/node).  
# 
FROM golang:1.12.0 AS builder
COPY qemu-arm-static /usr/bin

FROM arm32v7/node:latest
LABEL maintainer="Joey Chen <joeychen.zh@gmail.com>"

COPY --from=builder /qemu-arm-static /usr/bin/qemu-arm-static

ENV NODE_ENV production

RUN npm i cloudcmd -g

EXPOSE 8000

ENTRYPOINT ["cloudcmd"]

