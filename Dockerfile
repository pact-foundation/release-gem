FROM ruby:2.7.5-alpine3.15

RUN apk add --update --no-cache git openssh bash github-cli
RUN gem update --system
RUN gem install bundler -v '~>2.1'

RUN mkdir -p home
WORKDIR home
ADD container/release/Gemfile /release/Gemfile
ENV BUNDLE_GEMFILE=/release/Gemfile
RUN bundle install
ADD container /

ENTRYPOINT /entrypoint.sh
