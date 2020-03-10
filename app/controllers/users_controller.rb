class UsersController < ApplicationController
  before_action :authorized
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.account_type == ("band_member" || "venue_manager" || "concert_goer")
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
    authorize @user
  end

  def show
    binding.pry
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by(params[:id])
    binding.pry
    @user.destroy
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
      :account_type
    )
  end

end
