#!/bin/sh

set -eux

PROJECT_ROOT="/go/src/github.com/${GITHUB_REPOSITORY}"

mkdir -p $PROJECT_ROOT
rmdir $PROJECT_ROOT
ln -s $GITHUB_WORKSPACE $PROJECT_ROOT
cd $PROJECT_ROOT

pwd


BINARY_NAME=${BINARY:-$PROJECT_NAME}

#if [ $GO111MODULE == 'on' ]; then
#go mod tidy
#else 
 
#go get -v ./...
#fi

EXT=''

if [ $GOOS == 'windows' ]; then
EXT='.exe'
fi

if [ -x "./build.sh" ]; then
  OUTPUT=`./build.sh "${CMD_PATH}"`
else
  go build -o "${BINARY_NAME}" "${CMD_PATH}"
  OUTPUT="${PROJECT_NAME}${EXT}"
fi

echo ${OUTPUT}
