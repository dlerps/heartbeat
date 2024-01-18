FROM debian:12-slim

RUN apt-get update \
    && apt-get install curl -y

WORKDIR /app
COPY ./scripts/heartbeat.sh .
RUN chmod +x heartbeat.sh

ENTRYPOINT [ "/app/heartbeat.sh" ]