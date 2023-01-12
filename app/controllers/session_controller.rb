class SessionController < ApplicationController
  def new
      @user=User.new
  end
  def create
      @user = User.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
         sessions[:user_id] = @user.id
         redirect_to 'posts_path'
      else
         flash.now[:notice] = "Invalid email and password"
         render :new
      end
   end
   def destroy
      session[:user_id]=nil
      redirect_to sign_in_path
   end 
   private
   def user_params
      params.require(:user).permit(:email,:password)  
   end   

  
end
