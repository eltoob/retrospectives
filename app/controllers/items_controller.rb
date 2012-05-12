class ItemsController < ApplicationController
  def create
    current_retro.create_item(params[:item])
    redirect_to retro_path(current_retro)
  end

  def update
    current_retro.items.detect do |item|
      item.id.to_s == params[:id]
    end.update_attributes(params[:item])
    head :ok
  end
end
