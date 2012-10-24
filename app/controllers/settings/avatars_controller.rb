# coding: utf-8
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
        flash[:success] = '有新头像喽。'
        redirect_to settings_profile_path
      end
    else
      render :show
    end
  end
end
