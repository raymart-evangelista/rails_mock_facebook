class PostsController < ApplicationController
  before_action :authenticate_user!

  def like
    @post = Post.find(params[:id])
    Like.create!(user_id: current_user.id, post_id: @post.id)
    redirect_to root_url, notice: "Post liked."
  end

  def unlike
    @post = Post.find(params[:id])
    Like.destroy_by(user_id: current_user.id, post_id: @post.id)
    redirect_to root_url, notice: "Post unliked."
  end

  def index
    @posts = Post.all.reverse
    @users = User.all
  end

  def show
    @post = Post.find(parmas[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge({ user_id: current_user.id }))

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
