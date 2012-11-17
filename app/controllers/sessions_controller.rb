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
    user = User.where(:provider => auth['provider'], :authid => auth['uid']).first || User.create_with_omniauth(auth)
    auto_login user
    if user.weibo
      redirect_to root_path
    else
      redirect_to info_edit_path
    end
  end
  
  def failure
  end
end
