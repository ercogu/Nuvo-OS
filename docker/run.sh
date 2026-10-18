#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

IMAGE=nuvo-os-dev

# Build the image if it doesn't exist yet
docker image inspect "$IMAGE" >/dev/null 2>&1 || docker build -t "$IMAGE" docker/

# If no arguments are provided, a shell opens; otherwise, the command ./docker/run.sh make is executed
docker run --rm -it --user "$(id -u):$(id -g)" -v "$PWD":/work:Z "$IMAGE" "${@:-bash}"