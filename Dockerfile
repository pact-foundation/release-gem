FROM ruby:3.2.2-alpine3.18

RUN apk add --update --no-cache git openssh bash github-cli
RUN gem update --system
RUN gem install bundler -v '~>2.4'

RUN mkdir -p home
WORKDIR home
ADD container/release/Gemfile /release/Gemfile
ENV BUNDLE_GEMFILE=/release/Gemfile
RUN bundle install
ADD container /

ENTRYPOINT /entrypoint.sh
