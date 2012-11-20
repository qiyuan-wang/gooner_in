# encoding: utf-8
class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(params[:user])
    if session[:omniauth]
      auth = session[:omniauth]
      @user.authentications.build(:provider => auth[:provider], :authid => auth[:authid])
      @user.url = auth[:url]
      @user.save(validate:false)
    else 
      @user.save
    end
    if @user.valid?
      auto_login @user
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def bind
    @user = User.new
    @user.name = auth[:name]
    
    #raise @user.to_yaml
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
