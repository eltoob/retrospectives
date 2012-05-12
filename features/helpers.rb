module Helpers
  def visit_home_page
    visit "/"
    page.should have_css("body .header")
  end
end

include Helpers
