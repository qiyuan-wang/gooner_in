# coding: utf-8
class Settings::PasswordsController < ApplicationController
  layout "settings"
  
  before_filter :require_login
  before_filter :find_user
  
  
  def show
  end

  def update
    if @user.update_attributes params[:user]
      flash[:success] = '密码已更新，下次用新密码登录，干巴咧！'
      redirect_to :action => :show
    else
      redirect_to questions_path
    end
  end
  
  def find_user
    @user = current_user
  end
end
