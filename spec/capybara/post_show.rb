require 'rails_helper'

RSpec.feature 'Posts show page' do
  user1 = User.create(name: 'Pamela', bio: 'A software developer')
  user2 = User.create(name: 'Pamela', bio: 'A software developer')
  post2 = Post.create(title: 'title', text: 'text', author_id: user1.id, comments_counter: 0, likes_counter: 0)
  Comment.create(text: 'I am Lanzz', author_id: user2.id, post_id: post2.id)
  Comment.create(text: 'I am Lanzz', author_id: user2.id, post_id: post2.id)
  Comment.create(text: 'I am Lanzz', author_id: user2.id, post_id: post2.id)
  Comment.create(text: 'I am Lanzz', author_id: user2.id, post_id: post2.id)

  scenario "I can see the post's title." do
    visit user_post_path(user1, post2)
    expect(page).to have_content(post2.id)
  end
  scenario "I can see the post's author." do
    visit user_post_path(user1, post2)
    expect(page).to have_content(user1.name)
  end
  scenario 'I can see the number of comments of a post.' do
    visit user_post_path(user1, post2)
    expect(page).to have_content(post2.comments_counter)
  end
  scenario 'I can see the number of likes of a post.' do
    visit user_post_path(user1, post2)
    expect(page).to have_content(post2.likes_counter)
  end
  scenario "I can see the post's text." do
    visit user_post_path(user1, post2)
    expect(page).to have_content(post2.text)
  end
  scenario "I can see the comment's author's username." do
    visit user_post_path(user1, post2)
    expect(page).to have_content(user2.name)
  end
  scenario "I can see the post's commenter." do
    visit user_post_path(user1, post2)
    expect(page).to have_content(user2.name)
  end
end
