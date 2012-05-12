require 'spec_helper'

describe ItemsController do
  describe "#create" do
    let(:retro) { stub_model(Retro) }
    let(:item) { stub_model(Item) }
    let(:parameters) { Hash.new }

    before do
      @controller.current_retro = retro
      retro.should_receive(:create_item).with(parameters) { item }
    end

    it "re-renders the retros page" do
      post :create, item: parameters
      response.should redirect_to(retro_path(retro))
    end
  end

  describe "#update" do
    let(:retro) { stub_model(Retro) }
    let(:item) { stub_model(Item) }
    let(:parameters) { Hash.new }

    before do
      retro.items = [item]
      @controller.current_retro = retro
    end

    it "updates a given item" do
      item.should_receive(:update_attributes).with(parameters) { true }
      post :update, id: item.id, item: parameters
    end
  end
end
