class SessionsController < ActionController::Base
	def create 
		@user = User.find_or_create_by_auth(auth_hash)
		if @user 
			session[:user_id] = @user.id
			redirect_to "/"
		else 
			redirect_to "/"
		end 
  end 

	protected 

	def auth_hash
		request.env['omniauth.auth']
	end 
end
