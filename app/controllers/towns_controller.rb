class TownsController < ApplicationController

 def new
 @town=Town.new
 end

 def index
 end

 def destroy
 end

def create
if current_user.admin?
@town=Town.new town_params
@town.save
flash[:success]= "Town Created!"
redirect_to new_town_path
else
flash[:danger] = "Not Authorized!"
redirect_to root_path
end
 end
private

 def town_params
 params.require(:town).permit(:name)
 end

end
