source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'bcrypt', '3.1.12'
gem 'faker'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'dotenv-rails', groups: [:development, :test]
gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '4.7.0'
gem 'will_paginate',           '3.1.7'
gem 'mysql2'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'kaminari'
gem 'puma', '~> 3.11'
gem 'bootstrap-sass',          '3.4.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot', '~>4.8.2'
  gem 'factory_bot_rails', '~>4.8.2'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'rails-erd'
  gem 'annotate'
  gem 'rubocop-airbnb'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'bullet'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers',
    git: 'https://github.com/thoughtbot/shoulda-matchers.git',
    branch: 'rails-5'
end

group :production do
  gem 'pg',   '0.20.0'
  gem 'fog', '1.42'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
