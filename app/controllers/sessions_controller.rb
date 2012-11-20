# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to root_path
    else
      flash.now.alert = "Email或密码错误"
      render 'new'
    end
  end
  
  def destroy
    logout
    redirect_back_or_to root_path
  end
  
  def auth
    auth = request.env["omniauth.auth"]
    redirect_to bind_path
  end
  
  def failure
  end
end
