class UsersController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], band_id: params[:user][:band_id], description: params[:user][:description])
    if user.valid?
      session[:user_id] = user.id
      binding.pry
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def delete
  end

  def index
    binding.pry
    @users = User.all
  end

  #private

  #def user_params
    #params.require(:user).permit(:name, :email, :password, :band_id, :description)
  #end

  # name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], band_id: params[:user][:band_id], description: params[:user][:description]

end
