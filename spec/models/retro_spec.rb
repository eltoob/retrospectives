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
end
