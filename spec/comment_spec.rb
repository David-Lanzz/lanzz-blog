require 'rails_helper'
describe Comment do
  describe '#post_comments_counter' do
    it 'should update the post comments_counter' do
      User.create(name: 'name', posts_counter: 0, id: 344)
      post = Post.create(title: 'title', text: 'text', author_id: 344, comments_counter: 0, likes_counter: 0)
      comment = Comment.create(text: 'text', author_id: 344, post:)
      comment.update_comments_counter
      expect(post.comments_counter).to eq(1)
    end
  end
end
