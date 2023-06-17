require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(author_id: 1, title: 'First Post', text: 'This is my first post', comments_counter: 1, likes_counter: 10)
  end

  before { subject.save }

  it 'should expect the title attribute to be present' do
    expect(subject.title).to be_present
  end
  it 'should expect the title length not to exceed 250 characters' do
    expect(subject.title.length).to_not be > 250
  end
  it 'should expect the comments counter to be greater than or equal to 0' do
    expect(subject.comments_counter).to be >= 0
  end
  it 'should expect the likes counter to be greater than or equal to 0' do
    expect(subject.likes_counter).to be >= 0
  end
  it 'should expect a user recent comments to return only three posts' do
    expect(subject.recent_comments.length).to be <= 5
  end
end
