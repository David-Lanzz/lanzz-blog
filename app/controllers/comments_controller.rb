class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.includes(users: :posts).find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = current_user.id
    @comment.author = current_user.name

    if @comment.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    else
      flash[:error] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
