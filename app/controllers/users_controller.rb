class UsersController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.update(user_params)
    if user.valid?
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def delete
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :band_id, :description)
  end

end
