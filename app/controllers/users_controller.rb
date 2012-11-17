class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.avatar = params[:user][:avatar]
    if @user.save
      auto_login @user
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.weibo = true
    if @user.update_attributes(params[:user])
      redirect_to root_path
    end
  end
end
