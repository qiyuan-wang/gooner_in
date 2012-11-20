# encoding: utf-8
class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login @user
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def bind
    @user = User.new
    raise session[:omniauth].to_yaml
    @user.authentications.build(:provider => auth['provider'], :authid => auth['authid'])
    @user.name = auth['name']
    @user.url = auth['url']
    #raise params[:auth]
  end
  
  def show
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      @user.set(:weibo, 1)
      redirect_to root_path
    else
      flash.now.alert = "Email或密码错误"
    end
  end
end
