class UsersController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
    @user.bands.build
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
      band_ids:[],
      bands_attributes:[
        :name,
        :email,
        :description,
        :genre_id
        ]
      )
  end

end
