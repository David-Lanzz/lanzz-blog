class Comment < ApplicationRecord
  belongs_to :post, foreign_key: 'post_id', counter_cache: true
  belongs_to :user, foreign_key: 'author_id'

  after_create :update_comments_counter

  def update_comments_counter
    post.update(comments_counter: post.comments_count)
  end
end
