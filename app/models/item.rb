class Item < ActiveRecord::Base
  HAPPY = 'happy'
  MEH = 'meh'
  SAD = 'sad'

  attr_accessible :category, :description

  def self.build_happy
    new.tap do |item|
      item.category = HAPPY
    end
  end

  def self.build_meh
    new.tap do |item|
      item.category = MEH
    end
  end

  def self.build_sad
    new.tap do |item|
      item.category = SAD
    end
  end
end
