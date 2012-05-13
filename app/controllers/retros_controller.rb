class RetrosController < ApplicationController
  def create
    self.current_retro = Retro.create(params[:retro])
    redirect_to retro_path(current_retro)
  end

  def update
    current_retro.update_attributes(params[:retro])
    head :ok
  end
end
