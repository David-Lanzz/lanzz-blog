require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'John Doe', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                        likes_counter: 0)
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'posts_counter should be an integer greater than or equal to zero' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end

  it '#recent_posts should return the three most recent posts' do
    4.times do
      Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    end
    expect(@user.recent_posts.count).to eq(3)
  end
end
