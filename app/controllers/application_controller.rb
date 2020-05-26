class ApplicationController < ActionController::Base
  before_action :set_login

  def set_login
    @current_user = User.find_by_id(session[:user_id])
   
  end
  

end
