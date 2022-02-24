#!/bin/bash
. .env

ENVIRONMENT=$1

case $ENVIRONMENT in

dev)
  echo "builds development server image..."
  docker build -f Dockerfile \
    --target=dev \
    --build-arg EXPOSED_PORT=${EXPOSED_PORT} \
    -t acbilson/${IMAGE_NAME}-dev:6.0 .
;;

prod)
  echo "builds production image..."
  docker build -f Dockerfile \
    --target=prod \
    --build-arg EXPOSED_PORT=${EXPOSED_PORT} \
    -t acbilson/${_IMAGE_NAME}:6.0 .
;;

*)
  echo "please provide one of the following as the first argument: dev, prod."
  exit 1

esac
