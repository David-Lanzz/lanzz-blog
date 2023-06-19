class CommentsController < ApplicationController
  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comments_params)

    if @comment.save
      redirect_to @comment
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comments_params)
      redirect_to @comment
    else
      render 'new'
    end
  end

  def comments_params
    params.require(@comment).permit(:author_id, :post_id, :text)
  end
end
