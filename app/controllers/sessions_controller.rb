class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_path(user.id)
    else
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in!"
        redirect_to user_path(user.id)
      else
        flash[:error] = "Oops. That didn't work. Please try again."
        redirect_to '/'
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
