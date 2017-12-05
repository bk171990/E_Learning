	class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception  

   def after_sign_in_path_for(resource)
      dashboard_home_index_path
   end

   # Method used for set current user
  def set_current_user
    User.current = current_user
  end
end
