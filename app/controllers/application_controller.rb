class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def confirm_user(user, redirect)
    if current_user.id == user.id
      return true
    else
      redirect_to redirect
    end
  end

  def redirect_home
    if user_signed_in?
      redirect_to tasks_path
    end
  end
end
