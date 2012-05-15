class RetrosController < ApplicationController
  def create
    self.current_retro = Retro.create(params[:retro])
    redirect_to retro_path(current_retro)
  end

  def show
    current_retro.action_items.create unless current_retro.action_items.present?
    current_retro.happy_items.create unless current_retro.happy_items.present?
    current_retro.meh_items.create unless current_retro.meh_items.present?
    current_retro.sad_items.create unless current_retro.sad_items.present?
  end

  def update
    current_retro.update_attributes(params[:retro])
    head :ok
  end
end
