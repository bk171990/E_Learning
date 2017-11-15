class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception  



   # Method used for set current user
  def set_current_user
    User.current = current_user
  end
end
