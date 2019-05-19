# README

This App basically register a track of visits of desired webpages that you put the app/assets/javascripts/trackerattor.js on.

It has an Redis at front to receive a huge amount of tracking data leaving the connection free asap and then the Sidekiq will run a Job to persist that data on MongoDB from the queue.

Things you'll need to run on development:

## Dependencies:
 - Ruby 2.5.5
 - Redis on port 6379
 - Sidekiq listening to development_default queue (for development)

## Or
  - Docker
  - Docker Compose

## Without Docker instructions:

 This project depends on Ruby described at `.ruby-version` file, if you dont known Ruby, take a look
at [this](https://www.ruby-lang.org/en/documentation/installation/) and it is a good idea to use a manager like `rvm`, take a look [here](https://rvm.io/rvm/install).

With ruby installed,

After you've cloned the project,

`cd teste-back-end`

`gem install bundler`

`bundle install`

`docker run -d -p 27017:27017 -e AUTH=no mongo`

`rake db:create`

`rake db:mongoid:create_indexes`

`bundle exec sidekiq -q development_default`


And in another terminal:
`bundle exec rails s`

To run tests:

`bundle exec rspec`

NOTE: if you use docker and some tests fails, its because docker creates some dir owned by root, just run this to fix ownership of the directories to your user:

`sudo chown $(whoami) -R .`

To run Rubocop (Ruby Style Guide Lint):
`bundle exec rubocop`

Pages of this project that have the tracker:
  - localhost:3000/contacts/new
  - after you submit the form, the show page that you'll be redirected also have the tracker.

Report:
  - localhost:3000/visits/report
  - localhost:3000/visits/report.json

Sidekiq:
  - localhost:3000/sidekiq

## Instructions to run with Docker-Compose

Just:

`docker-compose up --build`

The app will be up and running on localhost:3000 as above

Enjoy!
