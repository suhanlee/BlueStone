class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # helper_method :current_developer


  def current_developer_session
	return @current_developer_session if defined?(@current_developer_session)
	@current_developer_session = Developers.find(session[:developer_id])
  end

  def current_developer
	return @current_developer if defined?(@current_developer)
	@current_developer = Developer.find(session[:developer_id])
  end
  
  def check_login_status
	unless session[:developer_id]
		redirect_to :controller => "developer_login", :action => "login_form"
	end
  end
  
  def request_base_uri
	request.protocol + request.host_with_port
  end  


end
