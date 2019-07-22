#
# Makefile:  build Docker Images
#
.PHONY: build check-env

REPOS_NAME=atkmr
IMAGE_NAME=fluentd-s3-es
IMAGE_TAG=latest

build: dockerimage
	echo "Finished building docker images"

dockerimage:
	DOCKER_BUILDKIT=1 docker build -f Dockerfile -t ${IMAGE_NAME} .

push:
	docker tag ${IMAGE_NAME} ${REPOS_NAME}/${IMAGE_NAME}:${IMAGE_TAG}
	docker push ${REPOS_NAME}/${IMAGE_NAME}:${IMAGE_TAG}
