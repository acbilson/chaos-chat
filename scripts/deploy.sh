#!/bin/bash
. .env

ENVIRONMENT=$1

case $ENVIRONMENT in

prod)
  echo "enabling service..."
;;

*)
  echo "please provide one of the following as the first argument: uat, prod."
  exit 1

esac
