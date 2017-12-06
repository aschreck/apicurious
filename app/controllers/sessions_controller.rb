class SessionsController < ApplicationController 
	def create 
		@user = User.find_or_create_by_auth(auth_hash)
		if @user 
			session[:user_id] = @user.uid
			redirect_to dashboard_index_path 
		else 
			redirect_to "/"
		end 
  end 

	protected 

	def auth_hash
		request.env['omniauth.auth']
	end 
end
