#!/usr/bin/env zsh

docker build -t vmud-build-image .
docker run --rm vmud-build-image
