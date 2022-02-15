#!/bin/bash
. .env

ENVIRONMENT=$1

case $ENVIRONMENT in

uat)
  echo "stops container in uat..."
;;

prod)
  echo "stops container in production..."
;;

*)
  echo "please provide one of the following as the first argument: uat, prod."
  exit 1

esac
