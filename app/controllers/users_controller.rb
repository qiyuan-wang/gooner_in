# encoding: utf-8
class UsersController < ApplicationController
  after_filter :clear_session, :only => [:create]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if session[:omniauth]
      auth = session[:omniauth]
      @user.authentications.build(:provider => auth[:provider], :authid => auth[:authid])
      @user.url = auth[:url]
      @user.weibo = 2
    end
    if @user.save
      auto_login @user
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def bind
    @user = User.new
    if session[:omniauth]
      @user.name = session[:omniauth][:name]
    end
  end
  
  def show
  end
  
  def clear_session
    if session[:omniauth]
      session[:omniauth] = nil
    end
  end
end
