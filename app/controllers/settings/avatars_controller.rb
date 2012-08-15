class Settings::AvatarsController < ApplicationController
  def show
  end
  
  def update
    current_user.update_attributes params[:user]
    current_user.avatar = params[:user][:avatar]
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
