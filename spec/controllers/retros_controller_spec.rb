require 'spec_helper'

describe RetrosController do
  describe "#create" do
    let(:retro) { stub_model(Retro) }
    let(:parameters) { Hash.new }

    before do
      Retro.should_receive(:create).with(parameters) { retro }
    end

    it "redirects to the newly created retrospective" do
      post :create, retro: parameters
      response.should redirect_to(retro_path(retro))
    end

    it "sets the current retrospective" do
      post :create, retro: parameters
      @controller.current_retro.should == retro
    end
  end
end
