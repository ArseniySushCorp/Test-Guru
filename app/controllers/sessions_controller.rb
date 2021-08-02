class SessionsController < Devise::SessionsController
  after_action :greetings_after_login, only: :create

  def create
    super
  end

  private

  def greetings_after_login
    flash[:notice] = current_user.sign_in_count == 1 ? t('signed_up', name: current_user.first_name) : t('signed_in')
  end
end
