require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response' do
      get posts_path(User.first)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get posts_path(User.first)
      expect(response).to render_template(:index)
    end
    it 'includes correct placeholder text in the response body' do
      get posts_path(User.first)
      expect(response.body).to include('Post')
    end
  end

  describe 'GET /users/:user_id/posts/:post_id' do
    it 'returns a successful response' do
      get post_path(User.first, Post.first)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get post_path(User.first, Post.first)
      expect(response).to render_template(:show)
    end
    it 'includes correct placeholder text in the response body' do
      get post_path(User.first, Post.first)
      expect(response.body).to include('Comments')
    end
  end
end
