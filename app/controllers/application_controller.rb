class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    

	#customize message if a user tries to edit another user for whom they are not authorized
	rescue_from CanCan::AccessDenied do |exception|
	  redirect_to main_app.root_url, :alert => exception.message
	end
  
end
