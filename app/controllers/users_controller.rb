class UsersController < ApplicationController
  def dashboard
  end

  def update
    current_user.update_attributes(
      :pivotal_tracker_api_key => params[:user][:pivotal_tracker_api_key],
      :pivotal_tracker_project_id => params[:user][:pivotal_tracker_project_id]
    )
    redirect_to dashboard_users_path
  end
end
