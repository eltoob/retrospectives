module Helpers
  def visit_home_page
    visit "/"
    should_be_on("/")
  end

  def click_start
    click_on "Start"
  end

  def should_be_on(path)
    page.should have_css("body .header")
    current_path.should == path
  end
end

include Helpers
