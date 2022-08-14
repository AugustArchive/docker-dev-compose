#!/bin/bash

BOOTSTRAP_CHECKS=${BOOTSTRAP_CHECKS:-yes}

check_if_cmds_exists() {
  if ! command -v docker &> /dev/null; then
    echo "[::terraform] ❌  Missing Docker installation, please install the Docker engine and re-run this script."
    exit 1
  fi

  if [[ "$BOOTSTRAP_CHECKS" =~ ^(yes|true|1|si|si*)$ ]]; then
    if ! command -v jq &> /dev/null; then
      echo "[::terraform] ❌  \`jq\` is required for bootstrap checks, please install it and re-run this script or apply \`BOOTSTRAP_CHECKS=0\` to disable bootstrap checks."
      exit 1
    fi
  fi
}

check_if_fluff_network_exists() {
  if [[ "$BOOTSTRAP_CHECKS" =~ ^(yes|true|1|si|si*)$ ]]; then
    NETWORK=$(docker network ls --format '{"name":"{{ .Name }}"}' -f 'driver=bridge' | jq --slurp | jq '.[].name | index("fluff")' | tail -n 1)
    if [[ "$NETWORK" == "null" ]]; then
      echo "[::terraform] 🌱  Missing \`fluff\` network! Creating..."
      ID=$(docker network create fluff --driver=bridge)

      echo "[::terraform] 🌱  Created \`fluff\` network! You can run \`docker network inspect $ID\` to inspect it"
    else
      echo "[::terraform] 🌱  Found existing \`fluff\` network!"
    fi
  fi
}
