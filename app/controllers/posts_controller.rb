class PostsController < ApplicationController
  def index
    @posts=Post.all
    if session[:user_id]
      @user=User.find_by(id:session[:user_id])
    end 
  end
  def show
    @post=Post.find(params[:id])
  end 
  def new
    @post=Post.new    
  end  
  def create
    @user=User.first
    @post=@user.posts.create(post_params)
    if @post.save
      redirect_to @post
    end  
  end 


  def post_params
    params.require(:post).permit(:caption,:author_user)
  end  
end
