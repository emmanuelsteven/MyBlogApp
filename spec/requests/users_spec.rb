require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'includes the correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('my blog placeholder')
    end
  end
  describe 'GET /users/:id' do
    # Create a user for testing
    let(:user) do
      User.create(name: 'Steven', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from jos.',
                  post_counter: 0)
    end
    it 'returns a successful response' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'includes the correct placeholder text in the response body' do
      get "/users/#{user.id}"
      expect(response.body).to include('Details for a selected user with post')
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
  end
end
