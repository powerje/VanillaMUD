#!/usr/bin/env zsh

docker build -t vmud-build-image .
docker run -p 9000:9000 --rm vmud-build-image

# To just generate and copy a binary to the host:
#containerId=$(docker create -t vmud-build-image .)
#docker cp "$containerId":/mud/bin/release/VanillaMUD mud
#docker rm "$containerId"
