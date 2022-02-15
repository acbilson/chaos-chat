#!/bin/bash
. .env

ENVIRONMENT=$1
CONTAINER=$2

case $ENVIRONMENT in

dev)

	case $CONTAINER in

	client)
	docker run -it --rm \
	  --expose ${CLIENT_EXPOSED_PORT} -p ${CLIENT_EXPOSED_PORT}:80 \
	  -v ${CLIENT_CODE_SOURCE_SRC}:${CODE_SOURCE_DST} \
	  --name ${CLIENT_IMAGE_NAME} \
	  acbilson/${CLIENT_IMAGE_NAME}-dev:6.0
	;;

	server)
	docker run -it --rm \
	  --expose ${SERVER_EXPOSED_PORT} -p ${SERVER_EXPOSED_PORT}:80 \
	  -v ${SERVER_CODE_SOURCE_SRC}:${CODE_SOURCE_DST} \
	  --name ${SERVER_IMAGE_NAME} \
	  acbilson/${SERVER_IMAGE_NAME}-dev:6.0
	;;

	*)

	# runs both containers in network
	docker-compose up -d
	esac
;;

*)
  echo "please provide one of the following as the first argument: dev, prod."
  exit 1

esac
