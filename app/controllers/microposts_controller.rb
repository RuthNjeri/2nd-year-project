class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

 def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
			@userrequests=Array.new
			@userrequests=UserRequest.where(:town_id =>@micropost.town_id)
  	 if !@userrequests.nil? 
				@userrequests.each do |u|   								
     		Notification.create!(micropost:@micropost,user_id: u.user_id) 
				end
			end

      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

   def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  #def show
  #@microposts=micropost.find(params [:id])
  #end
 
  private

   def micropost_params
      params.require(:micropost).permit(:region,:price,:details,:town_id,:picture)
    end
end
