
# cURL Wrapper in Docker

<div align="left">

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/c0depool/curl-wrapper/Docker?style=for-the-badge)](https://github.com/c0depool/curl-wrapper/actions/workflows/docker-publish.yml)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/c0depool/curl-wrapper?sort=semver&style=for-the-badge)](https://github.com/c0depool/curl-wrapper/releases)

</div>

Simple wrapper for cURL to periodically execute HTTP requests with support for complex HTTP payloads.

## Usage

Simple HTTP Request to example.com every 10 seconds:

```bash
docker run -e URL=https://example.com \
-e INTERVAL=10 \
ghcr.io/c0depool/curl-wrapper
```

A complex HTTP request with json payload using docker compose:

```yml
version: "3.9"
services:
  curl:
    container_name: curl-wrapper
    image: ghcr.io/c0depool/curl-wrapper
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

