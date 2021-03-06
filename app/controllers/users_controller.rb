class UsersController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:new, :create]
  load_and_authorize_resource

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.account_type_valid?
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
    @user = User.find_by_id(params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Edit Successful."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.id == current_user.id
      @user.destroy
      session.destroy
      redirect_to root_path
    elsif current_user.admin?
      @user.destroy
      flash[:success] = "User deleted"
      redirect_to '/users'
    else
      redirect_to '/users'
    end
  end

  def index
    @users = User.all
    if params[:option].present?
      case params[:option]
      when "1"
        @users = @users.band_member
      when "2"
        @users = @users.venue_manager
      when "3"
        @users = @users.concert_goer
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :description,
      :account_type,
      :image
    )
  end
end
