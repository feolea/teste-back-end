# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

gem 'mongoid', '~> 7.0.2'
gem 'puma', '~> 3.11'
gem 'rack-cors', '~> 1.0.3'
gem 'rails', '~> 5.2.3'
gem 'redis', '~> 4.0'
gem 'sidekiq', '~> 5.2.7'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5.2.0'
gem 'uglifier', '>= 1.3.0'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', '~> 11.0.1'
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'mongoid-rspec', '~> 4.0.1', require: false
  gem 'rails-controller-testing', '~> 1.0.4'
  gem 'rspec-json_expectations', '~> 2.2.0'
  gem 'rspec-rails', '~> 3.8'
  gem 'rubocop', '~> 0.69.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
