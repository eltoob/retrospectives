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
end
