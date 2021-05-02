class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
      when Public
        public_homes_top_path
      when Admin
        admin_homes_index_path
    end
  end

    def after_sign_out_path_for(resource)
      new_public_session_path
    end
end
