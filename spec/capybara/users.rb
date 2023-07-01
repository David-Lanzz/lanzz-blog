require 'rails_helper'

RSpec.feature 'User index page' do
  user1 = User.create(name: 'Pamela', bio: 'A software developer')
  user2 = User.create(name: 'Lanzz', bio: 'A software developer')
  User.create(name: 'Lanzz', bio: 'A software developer')

  scenario 'User can see the usernames of other users' do
    visit users_path

    expect(page).to have_content(user1.name)
  end
  scenario 'User can see profile pictures' do
    visit users_path
    expect(page).to have_content(user1.photo)
  end

  scenario 'User can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_content(user2.posts_counter)
  end

  scenario "When I click on a user, I am redirected to that user's show page." do
    visit users_path
    click_link(user1.name)
    expect(current_path).to eq(user_path(user1))
  end
end
