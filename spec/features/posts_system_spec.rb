require 'rails_helper'
RSpec.describe 'User', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'SteveEmmanuel',
                              photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'I am steve a fine brave african man that loves coding', post_counter: 0)
    @second_user = User.create(name: 'MilkyNwoye',
                               photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'A medical lab scientist and tech guru from Gambia.', post_counter: 0)

    @first_post = Post.create(author: @first_user, title: 'Family health', text: 'The current health state of the Nigeria people',
                              comment_counter: 0,
                              likes_counter: 0)

    @comment = Comment.create(post: @first_post, author: @first_user,
                              text: 'lets make this blog come alive')
  end
  describe 'post index' do
    before(:each) do
      visit user_posts_path(@first_user)
    end

    it 'I can see the user\'s profile picture.' do
      expect(page).to have_css('.profile')
    end
    it 'I can see the user\'s username.' do
      expect(page).to have_content(@first_user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 1'
    end
    it 'I can see a post\'s title.' do
      expect(page).to have_content 'Family health'
    end
    it 'I can see some of the post\'s body.' do
      expect(page).to have_content 'The current health state of the Nigeria people'
    end
    it 'I can see the first comments on a post.' do
      expect(page).to_not have_content 'lets make this blog come alive'
    end
    it 'I can see how many comments a post has.' do
      expect(page).to have_content 'Comments: 1'
      expect(page).to_not have_content 'Comments: 0'
    end
    it 'I can see how many likes a post has.' do
      expect(page).to_not have_content 'Likes: 1'
      expect(page).to have_content 'Likes: 0'
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to_not have_content 'Pagination'
    end
    it 'When I click on a post, it redirects me to that posts show page.' do
      click_link 'Family health'
      expect(page).to have_current_path(user_post_path(@first_user, @first_post))
    end
  end
end
