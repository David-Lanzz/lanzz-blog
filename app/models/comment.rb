class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :update_comments_counter

  def update_comments_counter
    post.update(posts_counter: post.comments.count)
  end
end
