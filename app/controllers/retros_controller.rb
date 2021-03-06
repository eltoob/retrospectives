class RetrosController < ApplicationController
  before_filter do
    return unless params[:id]

    self.current_retro ||= Retro.find_by_id(params[:id])

    if current_retro && current_retro.user
      if user_signed_in? && current_user != current_retro.user
        self.current_retro = nil
        flash[:alert] = "That's not your retro."
        redirect_to root_path and return
      end

      unless user_signed_in?
        self.current_retro = nil
        flash[:alert] = "That's not your retro."
        redirect_to root_path and return
      end
    end
  end

  def create
    retro = Retro.new(params[:retro])
    retro.user = current_user if user_signed_in?
    retro.save

    self.current_retro = retro

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

  def send_to_tracker
    logger.warn current_user.inspect

    current_retro.unassigned_action_items.each do |action_item|
      action_item.send_to_tracker(current_user.pivotal_tracker_api_key, current_user.pivotal_tracker_project_id)
    end

    head :ok
  end
end
