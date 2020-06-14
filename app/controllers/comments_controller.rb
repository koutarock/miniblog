class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = Comment.new
  end
  
  def create
    # koreha shinse ga kaitemasu.
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    # same as line below. @comment.post_id = params[:post_id]
    @comment.post_id = @post.id
    p '@comment.valid'
    p @comment.valid?
    p @comment.errors
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end