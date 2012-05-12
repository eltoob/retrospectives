require File.dirname(__FILE__) + '/feature_helper'

describe "Retrospective", type: :request do
  describe "creating a new retrospective" do
    it "allows a user to go to the site and create a retro" do
      visit_home_page
      click_start
      should_be_on('/retros/1')
    end

    it "allows a user to create a new happy item" do
      visit_home_page
      click_start
      click_add_happy_item
      fill_in_happy_item
      reload_the_page
      should_still_see_happy_item
    end
  end
end

