class UsersController < ApplicationController
before_action :authenticate,   only: [:index,:edit, :update, :destroy]
before_action :correct_user,   only: [:edit, :update]
before_action :admin_user,     only: :destroy 
before_action :signed_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

 def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end  

 def index
 @users = User.paginate(page: params[:page],per_page: 10)
 end

 def show
    @user = User.find(params[:id])
    @title=@user.name
    @microposts = @user.microposts.paginate(page: params[:page])
  end

 def new
    @user = User.new
    @title = "Sign up"
  end


  def create
  @user = User.new(user_params)
    if @user.save
     @user.send_activation_email
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
 end

  def edit
    @user = current_user
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
 if @user.update_attributes(user_params)
  redirect_to @user, :flash =>{:success =>"Profile updated"}
  else
   @title = "Edit user"
  render 'edit'
  end
 end

 def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
#def current_user
 #  current_user = User.find (params[:id])
#end

def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
  end

def followers
  @title = "Followers"
  @user  = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page])
end
 def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
 private
 
  def authenticate
    deny_access unless signed_in?
  end
    def user_params
    params.require(:user).permit(:name, :email,:password,:password_confirmation, :surname)
  end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
      def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
 end
 

