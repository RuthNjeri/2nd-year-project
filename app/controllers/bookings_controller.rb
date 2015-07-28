class BookingsController < ApplicationController
  def create
  	@booking = Booking.new
  	@booking.micropost_id= params[:micropost_id]
  	@booking.user=current_user
  	@booking.save
  	redirect_to bookings_path

  end

  def destroy
  	Booking.find_by(user_id: current_user.id, micropost_id: params[:micropost_id]).destroy
  	redirect_to bookings_path
  end

  def show
   @microposts = Array.new()

   Booking.where(user_id: current_user.id).each do | booking|
   	@microposts<< Micropost.find(booking.micropost_id)

  end
end
end
