class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      homes_top_path
    when Admin
      admin_homes_index_path
    end
  end

    def after_sign_out_path_for(resource)
      case resource
      when :customer
        new_customer_session_path
      when :admin
        new_admin_session_path
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
