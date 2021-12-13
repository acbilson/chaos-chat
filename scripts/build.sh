#!/bin/bash
. .env

ENVIRONMENT=$1

case $ENVIRONMENT in

dev)
  echo "builds development client image..."
  docker build -f client/Dockerfile \
    --target=dev \
    --build-arg EXPOSED_PORT=${EXPOSED_PORT} \
    -t acbilson/${IMAGE_NAME}-client-dev:6.0 .

  echo "builds development server image..."
  docker build -f server/Dockerfile \
    --target=dev \
    --build-arg EXPOSED_PORT=5000 \
    -t acbilson/${IMAGE_NAME}-server-dev:6.0 .
;;

prod)
  echo "builds production image..."
  docker build -f Dockerfile \
    --target=prod \
    --build-arg EXPOSED_PORT=${EXPOSED_PORT} \
    -t acbilson/${IMAGE_NAME}:6.0 .
;;

*)
  echo "please provide one of the following as the first argument: dev, uat, prod."
  exit 1

esac
