class UserRequestsController < ApplicationController
  def index
  end

  def create

 @userrequest = UserRequest.new userrequest_params 
@userrequest.user=current_user
 @userrequest.save
flash[:success]="Request saved"
redirect_to new_user_request_path

  end

  def new
 @userrequest = UserRequest.new
 @towns= Town.all
  end

  def destroy
  end

  def show
  end


private
  def userrequest_params
 params.require(:user_request).permit(:town_id)
 end
end
