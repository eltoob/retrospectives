require 'spec_helper'

describe Retro do
  describe "#create_item" do
    it "creates an item" do
      item = stub_model(Item)
      attrs = Hash.new
      Item.should_receive(:create).with(attrs) { item }

      retro = Retro.new
      retro.create_item(attrs)
      retro.items.should include(item)
    end
  end
end