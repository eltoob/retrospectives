require 'spec_helper'

describe RetrosController do
  let(:current_user) { stub_model(User) }

  before do
    sign_in(current_user)
  end

  describe "#create" do
    let(:retro) { stub_model(Retro) }
    let(:parameters) { Hash.new }

    before do
      retro
      Retro.should_receive(:new).with(parameters) { retro }
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

  describe "#update" do
    let(:retro) { stub_model(Retro) }
    let(:parameters) { Hash.new }

    before do
      retro
      @controller.current_retro = retro
      retro.should_receive(:update_attributes).with(parameters) { true }
    end

    it "returns successfully" do
      post :update, id: retro.id, retro: parameters
      response.should be_success
    end
  end
end
