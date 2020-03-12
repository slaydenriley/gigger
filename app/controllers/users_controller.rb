class UsersController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:new, :create]
  load_and_authorize_resource

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.account_type == "band_member" || @user.account_type == "venue_manager" || @user.account_type == "concert_goer"
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.id == current_user.id
      @user.destroy
      session.destroy
      redirect_to root_path
    elsif current_user.admin?
      @user.destroy
      redirect_to '/users'
    else
      redirect_to '/users'
    end
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
      :account_type
    )
  end

  def fb_params
    params.require(:user).permit(:account_type)
  end
end
