Heartbeat
=========

Simple docker image for sending Heartbeat requests to a Healthcheck instance with cURL.

## Run

The host system which sends the heartbeats needs docker to be installed. The supports two environment variables:

 - `HEARTBEAT_URL` (required): URL of the Healthcheck Ping API
 - `TIMEOUT_IN_SECONDS` (default: 1800): Delay in between heartbeat requests

Run via docker CLI:

```bash
docker run \
    -e HEARTBEAT_URL=http://healchecks.my-system.com/ping/uuid \
    -e TIMEOUT_IN_SECONDS=600 \
    dlerps/heartbeat:latest
```

Or use a `docker-compose.yaml`

```yaml
version: '3.9'

services:
  heartbeat:
    container_name: heartbeat
    image: dlerps/heartbeat:latest
    pull_policy: always
    restart: always
    environment:
      HEARTBEAT_URL: http://healchecks.my-system.com/ping/uuid
      TIMEOUT_IN_SECONDS: 600
 ```

 