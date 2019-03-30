class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    before_action :authenticate_user!
 
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def set_current_user
        @current_user = User.find(id: session[:user_id])
    end

end
