class AuthenticationsController < ApplicationController
  def index
  end

  def create
    auth = request.env["omniauth.auth"]
    authenctiation = Authentication.where(:provider => auth['provider'], :authid => auth['uid']).first
    if authentication
      auto_login authentication.user
      redirect_to root_path
    elsif current_user
      if current_user.authentications.create_and_initialize_with_auth auth
        current_user.set(:weibo, 1)
        redirect_to settings_profile_path
      end
    else
      session[:omniauth] = trim_info_from_auth auth
      redirect_to bind_path
    end
  end

  def destroy
  end
  
  def failure
  end
end
