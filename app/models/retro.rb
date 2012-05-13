class Retro < ActiveRecord::Base
  has_many :items

  def create_item(attrs = {})
    item = Item.new(attrs)
    item.retro_id = self.id
    item.save
    self.items.push(item)
    item
  end
end
