require 'rails_helper'
describe 'GET /users', type: :request do
  it 'renders a successful response' do
    get users_path
    expect(response).to be_successful
  end
  it 'renders the index template' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'includes correct placeholder text in the response body' do
    get users_path
    expect(response.body).to include('Username')
  end
end

describe 'GET /users/:id', type: :request do
  it 'returns a successful response' do
    get user_path(User.first)
    expect(response).to have_http_status(:success)
  end

  it 'renders the show template' do
    get user_path(User.first)
    expect(response).to render_template(:show)
  end
  it 'includes correct placeholder text in the response body' do
    get user_path(User.first)
    expect(response.body).to include('Number of posts')
  end
end
