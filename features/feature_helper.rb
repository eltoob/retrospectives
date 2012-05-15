ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  require 'capybara'
  require 'capybara/rspec'
  require File.dirname(__FILE__) + '/../config/environment'
  Capybara.app = Retrospective::Application
  Capybara.current_driver = :selenium
  require File.dirname(__FILE__) + '/helpers'
  require 'database_cleaner'

  RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before do
      Capybara.reset_sessions!
      DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
    end
  end
end
