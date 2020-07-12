#!/bin/sh

TAG=$1

: "${TAG:?Please provide the tag}"

git tag -a "${TAG}" -m "Releasing version ${TAG}"
git push origin "${TAG}"
