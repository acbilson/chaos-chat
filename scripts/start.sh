#!/bin/bash
. .env

ENVIRONMENT=$1

case $ENVIRONMENT in

dev)
docker run -it --rm \
  --expose ${EXPOSED_PORT} -p ${EXPOSED_PORT}:80 \
  -v ${CODE_SOURCE_SRC}:${CODE_SOURCE_DST} \
  --name ${IMAGE_NAME} \
  acbilson/${IMAGE_NAME}-dev:6.0
;;

*)
  echo "please provide one of the following as the first argument: dev, test."
  exit 1

esac
