class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment =@post.comments.create(comment_params)
        redirect_to post_path(@post)
    end
    def current_user    
        if session[:user_id]
            User.find(session[:user_id])
        end     
    end 
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post), status: :see_other
    end
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
end
