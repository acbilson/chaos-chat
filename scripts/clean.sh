#!/bin/bash
. .env

ENVIRONMENT=$1

case $ENVIRONMENT in

dev)
  echo "removing dist/"
  #rm -rf dist/
;;

*)
  echo "please provide one of the following as the first argument: dev, uat, prod."
  exit 1

esac
