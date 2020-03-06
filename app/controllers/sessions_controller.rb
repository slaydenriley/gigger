class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      binding.pry
      sessions[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    if current_user
      session.delete :user_id
      redirect_to '/'
    end
  end
end
