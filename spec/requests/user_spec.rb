require 'rails_helper'

describe 'GET /show' do
  it 'renders a successful response' do
    user = User.create(name: 'name', posts_counter: 0, id: 344)
    get "/users/#{user.id}"
    expect(response).to be_successful
  end
  it 'should expect a template from the show method' do
    user = User.create(name: 'name', posts_counter: 0, id: 344)
    get "/users/#{user.id}"
    expect(response).to render_template(:show)
  end
  it 'should expect the template body to include the correct text' do
    user = User.create(name: 'name', posts_counter: 0, id: 344)
    get "/users/#{user.id}"
    expect(response.body).to include('Users display here')
  end
end
