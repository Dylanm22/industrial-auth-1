class ApplicationController < ActionController::Base
   include Pundit
  
 
  after_action :verify_authorized, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private

   def user_not_authorized
     flash[:alert] = "you are not authorized to preform this action"

     redirect_back fallback_location: root_url
    end

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :private, :name, :bio, :website, :avatar_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :private, :name, :bio, :website, :avatar_image])
  end
end
