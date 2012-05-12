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

  def click_add_happy_item
    within_happy do
      click_on("Add")
    end
  end

  def fill_in_happy_item
    within_happy do
      fill_in "Description", with: happy_item_text
    end
  end

  def happy_item_text
    'Green Build'
  end

  def reload_the_page
    visit current_path
  end

  def should_still_see_happy_item
    within_happy do
      page.should have_field("Description", text: happy_item_text)
    end
  end
end

include Helpers
