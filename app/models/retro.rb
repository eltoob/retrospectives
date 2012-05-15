class Retro < ActiveRecord::Base
  SECONDS_IN_ONE_HOUR = 3600

  has_many :items
  has_many :happy_items, conditions: { :category => Item::HAPPY }, class_name: 'Item'
  has_many :meh_items, conditions: { :category => Item::MEH }, class_name: 'Item'
  has_many :sad_items, conditions: { :category => Item::SAD }, class_name: 'Item'
  has_many :action_items, conditions: { :category => Item::ACTION }, class_name: 'Item'

  attr_accessible :seconds_left

  after_initialize do
    unless self.seconds_left.present?
      self.seconds_left = SECONDS_IN_ONE_HOUR
    end
  end

  def create_item(attrs = {})
    item = Item.new(attrs)
    item.retro_id = self.id
    item.save
    self.items.push(item)
    item
  end

  def find_item_by_id(item_id)
    items.detect do |item|
      item.id == item_id.to_i
    end
  end
end
