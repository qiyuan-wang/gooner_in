class AuthenticationsController < ApplicationController
  def create
    raise request.env["omniauth.auth"].to_yaml
    authentication = Authentication.and({:provider => auth['provider']}, {:authid => auth['uid']}).first
    if authentication
      auto_login authentication.user
      redirect_to root_path
    elsif current_user
      if current_user.authentications.create(:provider => auth['provider'], :authid => auth['uid'])
        if auth['provider'] == "weibo"
          current_user.authentications.weibo.first.set(:url, auth['info']['urls']['Weibo'])
        elsif auth['provider'] == "douban"
          current_user.authentications.douban.first.set(:url, auth['info']['alt'])
        end
        redirect_to settings_profile_path
      end
    else
      session[:omniauth] = Authentication.trim_info_from_auth auth
      redirect_to bind_path
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to settings_profile_path
  end
  
  def failure
  end
end
