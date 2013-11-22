class DeveloperLoginController < ApplicationController

	def login_form
		@error = flash[:error]
		reset_session
	end
	
	def login
		# dynamic finder features is depreciated.
		@developer = Developer.find_by_email(params[:email])
		
		if @developer && (@developer.password == params[:password])
			session[:developer_id] = @developer.id
			redirect_to :controller => "apps", :action => "index"
		else
			flash[:error] = "Email account or password is wrong"
			redirect_to :action => "login_form"
		end
	end
	
	def logout
		reset_session
		redirect_to :action => "login_form"
	end

end
