class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_retro

  def after_sign_in_path_for(user)
    unless user.retros.present?
      self.current_retro = user.retros.create
      retro_path(current_retro)
    else
      dashboard_users_path
    end
  end

  def after_sign_out_path(user)
    "/"
  end

  after_filter do
    logger.warn "SessionID :: #{session['session_id']}"
  end

  def current_retro
    @current_retro ||= Retro.find_by_id(session[:current_retro_id])
  end

  def current_retro=(retro)
    @current_retro = retro
    session[:current_retro_id] = retro.try(:id)
  end
end
