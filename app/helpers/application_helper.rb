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

  def action_items_class
    'hide' if current_retro.over_half_time?
  end

  def happy_items_class
    'hide' unless current_retro.over_half_time?
  end
end
