#!/bin/bash

mkdir -p /etc/forgejo-runner
cat << EOF >/etc/forgejo-runner/config.yaml
log:
  level: info
  job_level: info

server:
  connections:
    forgejo:
      url: ${FORGEJO_URL}
      uuid: ${FORGEJO_RUNNER_UUID}
      token: ${FORGEJO_RUNNER_TOKEN}

runner:
  file: .runner
  capacity: 4
  timeout: 3h
  shutdown_timeout: 3h
  insecure: false
  fetch_timeout: 30s
  fetch_interval: 2s
  report_interval: 1s
  labels: ["node:docker://ghcr.io/shadichy/node:latest"]

cache:
  enabled: true
  port: 0
  dir: ""
  external_server: ""
  secret: ""
  secret_url: ""
  host: ""
  proxy_port: 0
  actions_cache_url_override: ""

container:
  network: ""
  enable_ipv6: false
  privileged: false
  options:
  workdir_parent:
  valid_volumes: []
  docker_host: "-"
  force_pull: false
  force_rebuild: false

host:
  workdir_parent:
EOF