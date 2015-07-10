class AccountActivationsController < ApplicationController
 
  def edit
    user = User.find_by(email: params[:email])
    if user 
      
      sign_in user 
      flash[:success] = "Account activated!"
      redirect_to user
   end
  end
end
