require File.dirname(__FILE__) + '/feature_helper'

describe "Retrospective", type: :request do
  describe "creating a new retrospective" do
    it "allows a user to go to the site and create a retro" do
      visit_home_page
    end
  end
end

