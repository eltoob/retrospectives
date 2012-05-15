class WelcomeController < ApplicationController
  def index
  end

  newrelic_ignore only: ['health_check']
  def health_check
  end
end
