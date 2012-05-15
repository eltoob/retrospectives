ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require File.dirname(__FILE__) + '/helpers'

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  Capybara.app = Retrospective::Application
  Capybara.current_driver = :selenium
  Capybara.default_wait_time = 10

  RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before do
      Capybara.reset_sessions!
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
    end
  end
end
