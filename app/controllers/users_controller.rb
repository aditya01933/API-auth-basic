class UsersController < ApplicationController

	before_action :authenticate
  
   def signin
      @t = User.find(1).access_token
      render json: @t 
   	  
	   	# c_user = User.find_by_email(params[:email])
	   	# pass = params[:password]
	   	# if c_user.password == pass

	   	#   render json: c_user.access_token
	   	# end  

        
    # authenticate_or_request_with_http_basic do |email, password|
    #   user = User.find_by_email(email)
    #   if user&& user.authenticate(password)
    #     render json: c_user.access_token
    #   else
    #     head :unauthorized
    #   end
    end





   private	
	def users_params	
		params.require(:user).permit(:email, :password)	
	end

private
  def authenticate
    authenticate_or_request_with_http_basic do |username, pas|
      user = User.find_by(email: username)
      if user&& user.password ==pas
        render json: user
      else
        head :unauthorized
      end
    end
  end

end
