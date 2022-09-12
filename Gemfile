# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'puma', '~> 5.0'
gem 'net-imap', require: false
gem 'net-smtp', require: false
gem 'net-pop', require: false
gem 'rails', '~> 6.1.6', '>= 6.1.6.1'
gem 'rack-cors'
gem 'pg'
gem 'pg_search'
gem 'blueprinter'
gem 'bcrypt', '~> 3.1.7'
gem 'knock', github: "nsarno/knock", branch: "master", ref: "9214cd027422df8dc31eb67c60032fbbf8fc100b"

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-core'
  gem 'rspec-expectations'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'rspec-support'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'pry-rails'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', '2.10.0'
  gem 'rubocop-performance', '1.13.3'
  gem 'dotenv-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
