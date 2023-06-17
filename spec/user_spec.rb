require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Lanzz', photo: 'photo image', bio: 'A pretty good software developer', posts_counter: 0) }

  before { subject.save }

  it 'should expect the name attribute to be present' do
    expect(subject.name).to be_present
  end
  it 'should expect the post counter to be greater than or equal to 0' do
    expect(subject.posts_counter).to be >= 0
  end
  it 'should expect a user recent post to return only three posts' do
    expect(subject.recent_posts.length).to be <= 3
  end
end
