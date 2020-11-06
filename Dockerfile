FROM ruby:2.6-alpine3.12

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing hub
RUN apk add --update --no-cache git openssh bash
RUN gem update --system
RUN gem install bundler -v '~>2.1'

RUN mkdir -p home
WORKDIR home
ADD container/release/Gemfile /release/Gemfile
ENV BUNDLE_GEMFILE=/release/Gemfile
RUN bundle install
ADD container /

ENTRYPOINT /entrypoint.sh
