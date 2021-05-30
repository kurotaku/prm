#Node.js & Yarn
FROM node:12.0-alpine as node

RUN apk add --no-cache bash curl && \
    curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.21.1

#Ruby & Bundler & mysql-client
FROM ruby:2.7.0-alpine

ARG RAILS_MASTER_KEY

COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /opt/yarn-* /opt/yarn
RUN ln -fs /opt/yarn/bin/yarn /usr/local/bin/yarn
RUN apk add --no-cache git build-base libxml2-dev libxslt-dev mysql-dev mysql-client tzdata bash less && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV RAILS_MASTER_KEY="${RAILS_MASTER_KEY}"
ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

RUN export
ENV LANG=ja_JP.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    BUNDLE_PATH=vendor/bundle \
    BUNDLE_APP_CONFIG=$APP_ROOT/.bundle
RUN gem update --system && \
    gem install --no-document bundler:2.1.4

