class ItemsController < ApplicationController
  def create
    current_retro.create_item(params[:item])
    redirect_to retro_path(current_retro)
  end
end
