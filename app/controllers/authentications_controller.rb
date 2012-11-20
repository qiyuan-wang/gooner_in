class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    authentication = Authentication.where(:provider => auth['provider'], :authid => auth['uid']).first
    if authentication
      auto_login authentication.user
      redirect_to root_path
    elsif current_user
      if current_user.authentications.create(:provider => auth['provider'], :authid => auth['uid'])
        current_user.set(:url, auth['info']['urls']['Weibo'])
        current_user.set(:weibo, 1)
        redirect_to settings_profile_path
      end
    else
      session[:omniauth] = Authentication.trim_info_from_auth auth
      redirect_to bind_path
    end
  end

  def destroy
  end
  
  def failure
  end
end
