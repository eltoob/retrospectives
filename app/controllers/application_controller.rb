class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_retro
    @current_retro ||= Retro.find(session[:current_retro_id])
  end

  def current_retro=(retro)
    @current_retro = retro
    session[:current_retro_id] = retro.try(:id)
  end
end
