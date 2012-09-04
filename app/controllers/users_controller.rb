class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.avatar = params[:user][:avatar]
    if @user.save
      auto_login @user
      redirect_to person_path @user.name
    else
      render 'new'
    end
  end
end
