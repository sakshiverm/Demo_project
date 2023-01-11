class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def index
    @user=User.all
  end
  def show
    @user=User.find(params[:id])
  end 
  def new
    @user=User.new
  end 
  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to '/welcome'
    else
      render :new, status: :unprocessable_entity 
    end  
  end 
  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:email,:password) 
  end  
end
