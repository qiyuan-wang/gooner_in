# coding: utf-8
class Settings::ProfilesController < ApplicationController
  layout "settings"
  
  before_filter :require_login
  before_filter :find_user
  
  def show
  end

  def update
    if @user.update_attribute(:description, params[:user][:description])
      flash[:success] = '个人介绍已经更新'
      redirect_to :action => :show
    else
      flash[:bad] = '更新失败'
      render :show
    end
  end

  def edit
  end
  
  def find_user
    @user = current_user
  end
end
