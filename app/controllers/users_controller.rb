class UsersController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)

    if user.valid?
      session[:user_id] = user.id
      redirect_to '/users/show'
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(user_params)
  end

  def update
  end

  def delete
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :description, :band_id)
  end

end
