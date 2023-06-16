class Comment < ApplicationRecord
  belongs_to :post

  def update_comments_counter
    posts.update(posts_counter: posts.comments.count)
  end
end
