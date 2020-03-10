class UsersController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    authorize @user, :update?
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
    authorize @user
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    authorize @user
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
      :account_type,
    )
  end
end
