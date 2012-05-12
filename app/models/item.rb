class Item < ActiveRecord::Base
  HAPPY = 'happy'

  def self.build_happy
    new.tap do |item|
      item.category = HAPPY
    end
  end
end
