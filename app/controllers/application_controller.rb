class ApplicationController < ActionController::Base
  before_action :authenticate_director!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :dob, :age, :bio, :oscar, :image, :address])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :dob, :age, :bio, :oscar, :image, :address])
  end
end
