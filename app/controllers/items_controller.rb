class ItemsController < ApplicationController
  def create
    item = current_retro.create_item(params[:item])
    render partial: 'item', locals: {item: item}
  end

  def update
    item = current_retro.find_item_by_id(params[:id].to_i)
    item.update_attributes(params[:item])
    head :ok
  end

  def destroy
    item = current_retro.find_item_by_id(params[:id].to_i)
    item.destroy if item
    render :json => {}
  end
end
