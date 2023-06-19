class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(posts_params)
      redirect_to @post
    else
      render 'new'
    end
  end

  def posts_params
    params.require(:post).permit(:author_id, :title, :text)
  end
end
