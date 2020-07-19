docker run --rm \
  -v ${PWD}:/home \
  -e GITHUB_TOKEN=token \
  -e GITHUB_ACTOR=bethesque \
  -e RUBYGEMS_API_KEY=key \
  -e GITHUB_WORKSPACE=/home \
  --entrypoint sh \
  -it release-gem
