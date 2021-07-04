class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    redirect_to sign_in_path unless current_user

    cookies[:user_path] = request.method_symbol.eql?(:get) ? request.original_url : nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
