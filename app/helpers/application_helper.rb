module ApplicationHelper
  def on_current_retro_page?
    current_retro.present? && request.fullpath == retro_path(current_retro)
  end
end
