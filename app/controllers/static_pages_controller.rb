class StaticPagesController < ApplicationController
 
  def home
@title = "Home"
 if signed_in?
 @micropost  = current_user.microposts.build
@feed_items = current_user.feed.paginate(page: params[:page])
  end
 end
 def search_land
  @micropost=Micropost.all

 end
  def region_price
  @micropost=Micropost.all
 end
    def region_acre
  @micropost=Micropost.all
 end
   def land_picture
  @micropost=Micropost.all
 end
 
    def land_type
  @micropost=Micropost.all
 end
   def land_booking
  @booking=Booking.all
 end
   def requests
  @userrequest=UserRequest.all
 end
  def what_to_know
@title = "What To Know"
  end
  def help
@title = "Help"
  end

  def about
@title = "About Us"
  end

  def contact
@title = "Contact"
  end


end
