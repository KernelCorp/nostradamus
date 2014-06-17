source 'https://rubygems.org'

#core
gem 'rails', '4.0.1'
gem 'mongoid', '4.0.0.beta1'


#front

# handlers
gem 'haml-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jbuilder', '~> 1.2'

# assets
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'

# various
gem 'uglifier', '>= 1.3.0'


#middle

# admin
gem 'activeadmin',         github: 'gregbell/active_admin', ref: '65aae6b68e78aad3071b2f85242b19fd3fccf426'
gem 'activeadmin-mongoid', github: 'elia/activeadmin-mongoid', branch: 'rails4'


#back
gem 'devise'

# model extention
gem 'mongoid_slug'
gem 'mongoid-paperclip', require: 'mongoid_paperclip'

# controller flow
gem 'cancancan', '~> 1.8'
gem 'omniauth'
gem 'omniauth-vkontakte'


gem 'russian'
gem 'vkontakte_api', '~> 1.4'
gem 'will_paginate'
gem 'will_paginate_mongoid'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rack'
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'quiet_assets'
  #gem 'rails-i18n-debug'
  gem 'net-ssh', '~> 2.7.0'
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'nginx-config'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn', platform: :ruby

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
