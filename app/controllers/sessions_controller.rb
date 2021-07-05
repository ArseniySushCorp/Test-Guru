class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies[:logged_off_request_path] || tests_path
      cookies.delete(:logged_off_request_path)
    else
      flash.now[:alert] = 'Are you Guru? Check your email and password'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
