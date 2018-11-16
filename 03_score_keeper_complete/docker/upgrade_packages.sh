#!/bin/sh
# modified from https://github.com/bitnami/minideb/blob/master/mkimage
set -eu
export DEBIAN_FRONTEND=noninteractive
n=0
max=2
until [ $n -gt $max ]; do
    set +e
    (
      apt-get update -qq &&
      apt-get upgrade -y --no-install-recommends
    )
    CODE=$?
    set -e
    if [ $CODE -eq 0 ]; then
        break
    fi
    if [ $n -eq $max ]; then
        exit $CODE
    fi
    echo "apt failed, retrying"
    n=$((n + 1))
done
rm -rf /var/lib/apt/lists /var/cache/apt/archives
