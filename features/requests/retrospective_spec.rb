require File.dirname(__FILE__) + '/../feature_helper'

describe "Retrospective" do
  describe "creating a new retrospective", type: :request do
    it "allows a user to add action items" do
      visit_home_page
      click_start
      click_open_action_items
      click_add_action_item
      fill_in_action_item
      reload_the_page
      should_still_see_action_item
    end
  end

  describe "creating a new retrospective", type: :request do
    it "allows a user to create a new happy item" do
      visit_home_page
      click_start
      click_add_happy_item
      fill_in_happy_item
      reload_the_page
      should_still_see_happy_item
    end
  end

  describe "creating a new retrospective", type: :request do
    it "creates a story in tracker" do
      api_token = '676e7bebe4187a0182e6d97cc3391a10'
      project_id = '549221'
      description = "Foo #{rand(1000)}"

      item = Item.new(description: description)
      item.send_to_tracker(
        api_token,
        project_id
      )

      PivotalTracker::Client.token = api_token
      project = PivotalTracker::Project.find(project_id)

      project.stories.all.detect do |story|
        story.name == description
      end.should be
    end
  end

  describe "creating a new retrospective", type: :request do
    it "allows a user to go to the site and create a retro" do
      visit_home_page
      click_start
      should_be_on('/retros/1')
    end
  end
end

