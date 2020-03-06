class UsersController < ApplicationController
  def new
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

  def login
  end

  def index
  end

end
