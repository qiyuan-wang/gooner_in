# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  protected
  def not_authenticated
    redirect_to log_in_path, :notice => "登录先啦。"
  end
  
end
