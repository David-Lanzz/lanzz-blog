require 'rails_helper'

RSpec.feature 'Users Show' do
  user1 = User.create(name: 'Pamela', bio: 'A software developer')
  post2 = Post.create(title: 'title', text: 'text', author_id: user1.id, comments_counter: 0, likes_counter: 0)
  comment1 = Comment.create(text: 'I am Lanzz', author_id: user1.id, post_id: post2.id)
  Comment.create(text: 'I am Lanzz', author_id: user1.id, post_id: post2.id)
  Comment.create(text: 'I am Lanzz', author_id: user1.id, post_id: post2.id)
  Comment.create(text: 'I am Lanzz', author_id: user1.id, post_id: post2.id)


  scenario "I can see the user's picture" do
    visit user_posts_path(user1)
    expect(page).to have_selector('.photo')
  end

  scenario "I can see the user's username" do
    visit user_posts_path(user1)
    expect(page).to have_content(user1.name)
  end

  scenario 'I can see the number of posts for a user' do
    visit user_posts_path(user1)
    expect(page).to have_content(user1.posts_counter)
  end
  scenario 'I can see some of the posts text' do
    visit user_posts_path(user1)
    expect(page).to have_content(post2.text)
  end

  scenario 'I can see some of the comments text' do
    visit user_posts_path(user1)
    expect(page).to have_content(comment1.text)
  end
  scenario 'I can see how many comments a post has' do
    visit user_posts_path(user1)
    expect(page).to have_content(post2.comments_counter)
  end
  scenario 'I can see how many likes a post has' do
    visit user_posts_path(user1)
    expect(page).to have_content(post2.likes_counter)
  end
  scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
    visit user_posts_path(user1)
    expect(page).to have_selector('.pagination')
  end
end
