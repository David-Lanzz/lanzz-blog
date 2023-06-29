require 'rails_helper'

RSpec.feature 'Users Show' do
  user1 = User.create(name: 'Pamela', bio: 'A software developer', photo: '')
  Post.create(title: 'title', text: 'text', author_id: user1.id, comments_counter: 0, likes_counter: 0)

  scenario 'User can see the usernames of other users' do
    visit user_path(user1)

    expect(page).to have_content(user1.name)
  end
  scenario 'User can see profile pictures' do
    visit user_path(user1)
    expect(page).to have_content(user1.photo)
  end

  scenario 'User can see the number of posts each user has written.' do
    visit user_path(user1)
    expect(page).to have_content(user1.posts_counter)
  end

  scenario 'User can a button which allows all posts to be displayed.' do
    visit user_path(user1)
    expect(page).to have_selector('.all-posts', wait: 3)
  end

  scenario 'At most 3 posts are displayed for a user' do
    visit user_path(user1)
    expect(page).to have_selector('.post', maximum: 3)
  end

  scenario "I can see the user's bio" do
    visit user_path(user1)
    expect(page).to have_content(user1.bio)
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    visit user_path(user1)
    click_link('see all posts')
    expect(current_path).to eq(user_posts_path(user1))
  end
end
