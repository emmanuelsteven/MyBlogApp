require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index/:user_id/posts' do
    it 'renders the index template' do
      user = User.create(name: 'Steven', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from jos.',
                         post_counter: 0)
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  describe 'GET /users/:user_id/posts/:id' do
    it 'renders the show template' do
      user = User.create(name: 'steven', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'series from jos',
                         post_counter: 0)
      post = Post.create(title: 'post1', author: user, likes_counter: 0, comment_counter: 0, created_at: 5.day.ago)
    get user_post_path(:user_id, :post_id)
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('Details of a selected post')
    end
  end
end
