#!/bin/bash
set -eo pipefail

ROOT=$(pwd)
IMAGE_DIR=$ROOT/output/boot.img

if [ ! -d "$ROOT/output" ]; then
  mkdir -p "$ROOT"/output
fi

if [ ! -e "$IMAGE_DIR" ]; then
  echo "Creating image: $IMAGE_DIR"
  dd if=/dev/zero of=./output/boot.img bs=512 count=20480
fi
