class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = @post.author.name
    @users = User.all
  end
end
