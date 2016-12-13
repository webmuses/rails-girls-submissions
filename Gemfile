ruby "2.3.0"

source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'omniauth-github'
gem 'unicorn'
gem 'pg'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'database_cleaner'
  gem "factory_girl_rails", "~> 4.0", require: false

  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'byebug'
  gem 'awesome_print'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem "better_errors"
  gem 'spring'
  gem "capistrano", "~> 3.3"
  gem "capistrano-rvm"
  gem "capistrano-bundler"
  gem "capistrano-rails"
  gem "capistrano3-unicorn"
end

group :production do
  gem 'rails_12factor'
end
