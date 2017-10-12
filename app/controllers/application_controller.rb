class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with:  :record_not_found

  def private_access
    redirect_to :new_user_session unless signed_in?
  end

  def public_access
    redirect_to root_path if !signed_in?
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fullname])
    end

    def record_not_found
    end

end
