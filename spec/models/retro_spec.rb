require 'spec_helper'

describe Retro do
  describe "#create_item" do
    it "creates an item" do
      item = stub_model(Item)
      attrs = Hash.new
      Item.should_receive(:new).with(attrs) { item }
      item.should_receive(:save)

      retro = Retro.new
      new_item = retro.create_item(attrs)
      retro.items.should include(item)
      new_item.should == item
    end
  end

  describe "#find_item_by_id" do
    it "returns the matching item by id" do
      item = stub_model(Item)
      retro = Retro.new

      retro.items = [item]
      retro.find_item_by_id(item.id).should == item
    end
  end

  describe "#over_half_time?" do
    it "returns false when the time under half of the number of seconds in an hour" do
      retro = Retro.new(seconds_left: 1)
      retro.over_half_time?.should be_false
    end

    it "returns true when the time is over half the number of secnods in an hour" do
      retro = Retro.new(seconds_left: 3600)
      retro.over_half_time?.should be_true
    end
  end
end
