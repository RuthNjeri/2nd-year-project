class SessionsController < ApplicationController
  def new
   @title = "Sign in"
  end
   def destroy
 sign_out
 redirect_to root_path
  end

   def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
        sign_in user
   redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
    
    end
  end




