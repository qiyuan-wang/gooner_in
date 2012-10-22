class Settings::AvatarsController < ApplicationController
  before_filter :require_login

  def show
  end
  
  def update
    current_user.update_attributes params[:user]
    if current_user.save!(validate: false)
      if params[:user][:avatar].present?
        render :crop
      else
        redirect_to person_path(current_user.name)
      end
    else
      render :show
    end
  end
end
