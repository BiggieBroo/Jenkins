#!/usr/bin/env bash

export IMAGE=$1

docker-compose -f ${IMAGE} up

