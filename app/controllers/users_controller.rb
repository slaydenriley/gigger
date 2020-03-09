class UsersController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]

  def new
    binding.pry
    @user = User.new
    @user.bands.build
  end

  def create
    user = User.create(user_params)
    binding.pry
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
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

  def destroy
    @user = User.find_by(params[:id])
    @user.delete
    session.destroy
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :description,
      :bands_attributes => [
        :name,
        :email,
        :description
      ]
    )
  end

end
