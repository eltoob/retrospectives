module ApplicationHelper
  def add_happy
    simple_form_for(Item.build_happy) do |form|
      form.input :category, as: 'hidden'
      form.submit "Add"
    end
  end
end
