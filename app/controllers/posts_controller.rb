class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @posts = @user.posts.includes(:comments)
    @users = User.includes(:posts)
  end

  def show
    @post = Post.includes(:author, :comments).find(params[:id])
    @comments = @post.comments
    @user = @post.author.name
    @user_id = @post.author.id
    @users = User.includes(:posts)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(author_id: current_user.id)
    else
      flash[:error] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
