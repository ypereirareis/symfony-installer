#!/usr/bin/env bash

LATEST_SF_VERSION=${LATEST_SF_VERSION:-"3.3"}
IMAGE_NAME="ypereirareis/symfony-installer"
DOCKER_CMD="docker run -it --rm -u $(id -u):$(id -g) -v $(pwd):/app ${IMAGE_NAME}"

check_error() {
  if [ "0" != "$1" ]; then
    shift
    echo "#### ERROR - Params: ${*}"
    clean_all_dir
    exit 100
  fi
}

clean_all_dir() {
  rm -rf ./*/
}

build_image() {
  echo "============== DOCKER BUILD IMAGE"
  docker build -t ${IMAGE_NAME} .
  check_error $? $*
}

exec_installer() {
  echo "============== RUN TEST with params ${*}"
  $DOCKER_CMD $*
  check_error $? $*
  
  if [ -d "$2" ]; then
    local latest=${3:-"${LATEST_SF_VERSION}"}
    cat $2/composer.json | grep symfony/symfony | grep ${latest}
    check_error $? $*
  fi

}

test_all() {
  clean_all_dir
  build_image
  exec_installer
  exec_installer new to_delete_1
  exec_installer new to_delete_2 2.8
  clean_all_dir
}

test_all
