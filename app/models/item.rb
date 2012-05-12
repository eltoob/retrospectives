class Item < ActiveRecord::Base
  HAPPY = 'happy'

  attr_accessible :category, :description

  def self.build_happy
    new.tap do |item|
      item.category = HAPPY
    end
  end
end
