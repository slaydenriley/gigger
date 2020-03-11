class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      @user = User.find_by(email: params[:email])
    else
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end
  end

  def destroy
    if current_user
      session.delete :user_id
      redirect_to '/'
    end
  end
end
