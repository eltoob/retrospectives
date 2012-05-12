class RetrosController < ApplicationController
  def create
    retro = Retro.create(params[:retro])
    redirect_to retro_path(retro)
  end
end
