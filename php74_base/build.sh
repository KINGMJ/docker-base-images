#!/bin/sh

# shellcheck disable=SC2039
source ./env.sh

# shellcheck disable=SC2154
echo docker build --build-arg HTTP_PROXY="$HTTPS_PROXY" --build-arg HTTPS_PROXY="$HTTPS_PROXY" -t "${image_name}":"${version}" .

# shellcheck disable=SC2086

# m1 芯片需要使用buildx构建，加上platform，不然默认构建的是arm64v8的，在linux上用不了
docker buildx build --platform=linux/amd64 --build-arg HTTP_PROXY="$HTTPS_PROXY" --build-arg HTTPS_PROXY="$HTTPS_PROXY" -t "${image_name}":"${version}" .
