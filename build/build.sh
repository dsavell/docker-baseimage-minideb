#/bin/bash

export DOCKER_ID_USER=''

docker build -t baseimage-minideb .
docker tag baseimage-minideb ${DOCKER_ID_USER}/baseimage-minideb:latest
docker tag baseimage-minideb ${DOCKER_ID_USER}/baseimage-minideb:buster
docker push ${DOCKER_ID_USER}/baseimage-minideb:latest
docker push ${DOCKER_ID_USER}/baseimage-minideb:buster
