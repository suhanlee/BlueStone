class UserLoginController < ApplicationController

	def login
		@user = User.find_by_name(params[:name])
		user_password = @user.password.to_s
		password = params[:password].to_s

		if @user && (user_password == password)
			res = { "response" => "success",
					"user_id" => @user.id,
					"name" => @user.name }
		else
			res = { "response" => "fail", "password1" => @user.password, "password" => params[:password] }		
		end
		
		respond_to do |format|
			format.json { render json:res }
		end
		
	end

end
