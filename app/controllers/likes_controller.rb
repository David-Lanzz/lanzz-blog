class LikesController < ApplicationController
  def index
    @like = Like.all
  end

  def new
    @like = Like.new
  end

  def show
    @like = Like.find(params[:id])
  end

  def create
    @like = Like.find(params[:id])
    if @like.save
      redirect_to @like
    else
      render 'new'
    end
  end

  def update
    @like = Like.find(params[:id])
    if @like.update(likes_params)
      redirect_to @like
    else
      render 'new'
    end
  end

  def likes_params
    params.require(@like).permit(:author_id, :post_id)
  end
end
