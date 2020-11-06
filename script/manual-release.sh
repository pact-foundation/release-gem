#!/bin/sh

# Run this from within the directory of the gem to be released.
# To build the docker image:
# docker build . -t release-gem --no-cache

set -euo

echo "Get your passphrase ready for the ssh private key..."

docker run --workdir /github/workspace --rm \
  -v $PWD:"/github/workspace" \
  -v ~/.ssh/id_rsa.pub:"/root/.ssh/id_rsa.pub" \
  -v ~/.ssh/id_rsa:"/root/.ssh/id_rsa" \
  -v ~/.ssh/known_hosts:"/root/.ssh/known_hosts" \
  -v ~/.gem/credentials:"/root/.gem/credentials" \
  -e GITHUB_WORKSPACE="/github/workspace" \
  -e GITHUB_TOKEN="${GITHUB_ACCESS_TOKEN_FOR_PF_RELEASES}" \
  -e GITHUB_ACTOR="${GITHUB_ACTOR:-bethesque}" \
  -e VERSION \
  -e INCREMENT \
  -it \
  release-gem
