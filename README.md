# cURL Wrapper in Docker

Simple wrapper for cURL to periodically execute HTTP requests with support for complex HTTP payloads.

## Usage

Simple HTTP Request to example.com every 10 seconds:

```bash
docker run -e URL=https://example.com \
-e INTERVAL=10 \
codepool/curl-wrapper:v0.0.1
```

A complex HTTP request with json payload using docker compose:

```yml
version: "3.9"
services:
  curl:
    container_name: curl-wrapper
    image: codepool/curl-wrapper:v0.0.1
    environment:
      URL: https://example.com/api
      METHOD: PUT
      INTERVAL: 30
      HEADER: |
        Content-Type: application/json
      DATA: |
        "[{\"metric\":\"cpu_temperature\",\"value\":\"$$(cat /cpu/temps)\"}]"
    volumes:
      - /cpu/temps:/cpu/temps:ro
```

