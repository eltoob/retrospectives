require 'pry'

module Helpers
  def visit_home_page
    visit "/"
    should_be_on("/")
  end

  def click_start
    click_on "Start"
  end

  def should_be_on(path)
    page.should have_css("body .navbar")
    current_path.should == path
  end

  def within_happy
    within("#happy") do
      yield
    end
  end

  def within_action_items
    within("#action_items") do
      yield
    end
  end

  def click_add_happy_item
    within_happy do
      click_on("Add")
    end
  end

  def click_open_action_items
    click_on("Action Items")
  end

  def click_add_action_item
    within_action_items do
      click_on("Add")
    end
  end

  def click_add_retro_item
    within_happy do
      click_on("Add")
    end
  end

  def fill_in_happy_item
    within_happy do
      fill_in "Description", with: happy_item_text
    end
  end

  def fill_in_action_item
    within_action_items do
      fill_in "Description", with: action_item_text
    end
  end

  def happy_item_text
    'Green Build'
  end

  def action_item_text
    'Set up remote test run'
  end

  def reload_the_page
    visit current_path
  end

  def should_still_see_happy_item
    within_happy do
      page.should have_field("Description", text: happy_item_text)
    end
  end

  def should_still_see_action_item
    click_open_action_items

    within_action_items do
      page.should have_field("Description", text: action_item_text)
    end
  end
end

include Helpers
