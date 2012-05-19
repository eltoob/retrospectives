module ApplicationHelper
  def on_current_retro_page?
    current_retro.present? && request.fullpath == retro_path(current_retro)
  end

  def autofocus?
    if @autofocus == false
      return false
    else
      @autofocus = false
      return true
    end
  end
end
