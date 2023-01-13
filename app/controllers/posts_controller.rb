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
    if session[:user_id]
      @user=User.find(session[:user_id])
    end
    @post=Post.new
  end
  def create
    if session[:user_id]
      @user=User.find(session[:user_id])
    end  
      @post=@user.posts.new(post_params)  
      if @post.save
        redirect_to @post
        #redirect_to user_post_path(current_user, @post)
      else
        render :new 
      end 
  end 
  def edit
    @post=Post.find(params[:id]) 
  end 
  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else  
      render :edit 
    end   
  end 
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to @post
  end  
  private
  def post_params
    params.require(:post).permit(:caption,:author_user,:image)
  end  
end
