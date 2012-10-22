# coding: utf-8
class Settings::PasswordsController < ApplicationController
  layout "settings"

  before_filter :require_login
  before_filter :find_user
  
  
  def show
  end

  def update
    if @user.update_attributes params[:user]
      flash[:success] = '更新成功'
      redirect_to :action => :show
    else
      redirect_to questions_path
    end
  end
  
  def find_user
    @user = current_user
  end
end
