class ItemsController < ApplicationController
  def create
    item = current_retro.create_item(params[:item])
    render partial: 'item', locals: {item: item}
  end

  def update
    current_retro.items.detect do |item|
      item.id.to_s == params[:id]
    end.update_attributes(params[:item])
    head :ok
  end
end
