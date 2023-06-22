require 'rails_helper'

describe 'GET/ show' do
  context 'do something' do
    it 'should expect to return a link path' do
      user = User.create(name: 'name', posts_counter: 0, id: 344)
      post = Post.create(title: 'title', text: 'text', author_id: user.id, comments_counter: 0, likes_counter: 0)
      get user_post_path(user, post)
      expect(response).to be_successful
    end

    it 'should expect a template from the show method' do
      user = User.create(name: 'name', posts_counter: 0, id: 344)
      post = Post.create(title: 'title', text: 'text', author_id: user.id, comments_counter: 0, likes_counter: 0)
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'should expect the template body to include the correct text' do
      user = User.create(name: 'name', posts_counter: 0, id: 344)
      post = Post.create(title: 'title', text: 'text', author_id: user.id, comments_counter: 0, likes_counter: 0)
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Posts display here')
    end
  end
end
