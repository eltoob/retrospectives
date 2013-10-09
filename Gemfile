# A sample Gemfile
source "https://rubygems.org"

ruby "1.9.3"

gem "rails"
group :production do
  gem 'pg'
end

group :developement, :test do
  gem 'sqlite3'
end

gem 'slim'
gem 'simple_form'
gem 'heroku'
gem 'jquery-rails'

gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

gem 'newrelic_rpm'
gem 'devise'
gem 'pivotal-tracker'

group :test do
  gem "rspec-rails"
  gem 'activerecord-nulldb-adapter'
  gem 'capybara'
  gem 'database_cleaner'
  gem "remarkable_activerecord", "~> 4.0.0.alpha4"
  gem 'pry'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
