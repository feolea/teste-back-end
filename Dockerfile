FROM ruby:2.5-alpine
RUN apk update && apk add build-base nodejs

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install --binstubs

COPY . .

CMD puma -C config/puma.rb
