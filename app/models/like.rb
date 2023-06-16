class Like < ApplicationRecord
  belongs_to :post

  def update_likes_counter
    posts.update(posts_counter: posts.posts.count)
  end
end
