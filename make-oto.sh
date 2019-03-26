#!/bin/bash
pip install awscli
eval $(aws ecr get-login --no-include-email --region us-east-1)
docker pull $BASE_IMAGE
make
export REPO=kibana-docker
export REGISTRY=$AWS_ACCOUNT_NUMBER.dkr.ecr.us-east-1.amazonaws.com
export IMAGE_TAG=$REGISTRY/$REPO
docker tag docker.elastic.co/kibana/kibana:$ELASTIC_VERSION $IMAGE_TAG:$ELASTIC_VERSION
docker push $IMAGE_TAG:$ELASTIC_VERSION
