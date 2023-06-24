class LikesController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @like = @post.likes.build(author_id: current_user.id)
    if @like.save
      redirect_to user_post_path(author_id: current_user.id, id: @post.id), notice: 'Post liked!'
    else
      redirect_to user_post_path(author_id: current_user.id, id: @post.id), alert: 'Sorry, there was an error.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
