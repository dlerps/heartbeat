FROM debian:12-slim

ARG UID=10001
ARG GID=10001
ARG USR=heartbeat

RUN groupadd -g $GID $USR \
  && useradd --create-home --no-log-init -u $UID -g $GID $USR

RUN apt-get update \
    && apt-get install curl -y

WORKDIR /app
COPY ./scripts/heartbeat.sh .
RUN chmod +x heartbeat.sh \
    && chown $USR .

USER $USR
ENTRYPOINT [ "/app/heartbeat.sh" ]