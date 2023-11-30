#!/bin/sh

# shellcheck disable=SC2039
source ./env.sh

# shellcheck disable=SC2154
echo docker build --build-arg HTTP_PROXY="$HTTPS_PROXY" --build-arg HTTPS_PROXY="$HTTPS_PROXY" -t "${image_name}":"${version}" .

# shellcheck disable=SC2086
docker build --build-arg HTTP_PROXY="$HTTPS_PROXY" --build-arg HTTPS_PROXY="$HTTPS_PROXY" -t "${image_name}":"${version}" .
