class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = @post.comments.create!(content: params[:comment][:content], user_id: @user.id, post_id: @post.id)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
