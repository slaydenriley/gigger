class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    
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

end
