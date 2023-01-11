class SessionController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end
  def login

  end 
  def create
    def create
      @user = User.find_by(first_name: params[:first_name])
      if @user && @user.authenticate(params[:password])
         sessions[:user_id] = @user.id
         redirect_to '/welcome'
      else
         redirect_to '/login'
      end
   end
  end  
  def page_requires_login

  end  
end
