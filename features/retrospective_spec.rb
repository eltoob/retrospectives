require File.dirname(__FILE__) + '/feature_helper'

describe "Retrospective", type: :request do
  describe "creating a new retrospective" do
    it "allows a user to go to the site and create a retro" do
      visit_home_page
      click_start
      should_be_on('/retros/1')
    end
  end
end

