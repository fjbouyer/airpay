class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :postal_code, :phone_number])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :postal_code, :phone_number])
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
