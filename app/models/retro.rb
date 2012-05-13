class Retro < ActiveRecord::Base
  has_many :items
  has_many :happy_items, conditions: { :category => Item::HAPPY }, class_name: 'Item'
  has_many :meh_items, conditions: { :category => Item::MEH }, class_name: 'Item'
  has_many :sad_items, conditions: { :category => Item::SAD }, class_name: 'Item'

  def create_item(attrs = {})
    item = Item.new(attrs)
    item.retro_id = self.id
    item.save
    self.items.push(item)
    item
  end
end
