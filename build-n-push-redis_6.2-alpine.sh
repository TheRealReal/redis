#!/bin/bash
AWS=$(which aws)
DOCKER=$(which docker)

cd 6.2/alpine/ || exit 0
PASSWD=$($AWS ecr get-login-password --region us-east-1) && \
$DOCKER login -u AWS -p "$PASSWD" 701240562969.dkr.ecr.us-east-1.amazonaws.com && \
$DOCKER build -f Dockerfile -t redis-6.2.6-alpine . && \
$DOCKER tag redis-6.2.6-alpine:latest 701240562969.dkr.ecr.us-east-1.amazonaws.com/redis:6.2.6-alpine && \
$DOCKER push 701240562969.dkr.ecr.us-east-1.amazonaws.com/redis:6.2.6-alpine
