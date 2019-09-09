#
# DESCRIPTION: A cloudcmd image for raspberry pi (based on arm32v7/node).  
# 
FROM arm32v7/node:latest
LABEL maintainer="Joey Chen <joeychen.zh@gmail.com>"

RUN npm i cloudcmd -g

EXPOSE 8000

ENTRYPOINT ["cloudcmd"]

