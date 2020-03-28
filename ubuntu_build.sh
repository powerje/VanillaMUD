#!/usr/bin/env zsh

docker build -t vmud-build-image .
docker run -p 9000:9000 --rm vmud-build-image
