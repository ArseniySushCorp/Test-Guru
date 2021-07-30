class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_up_path_for(user)
    if current_user.sign_in_count == 1
      flash[:notice] = t('signed_up', name: user.first_name)
    end
  end

  def after_sign_in_path_for(user)
    if user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[login first_name last_name])
  end
end
