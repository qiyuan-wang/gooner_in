class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #sign_in @user
      redirect_to root_path, notice: ""
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find_by(name: params[:user_name])
  end
end
