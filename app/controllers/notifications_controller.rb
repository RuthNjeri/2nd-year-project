class NotificationsController < ApplicationController
  def index
		@notifications=Notification.where(user_id: current_user.id)
		@not_seen = Notification.where(seen: false)
		
		if !@not_seen.nil?
		@not_seen.each do |n|
			n.seen = true
			n.save
		end

		end
  end

end
