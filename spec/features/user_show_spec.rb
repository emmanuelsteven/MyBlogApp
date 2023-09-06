require 'rails_helper'
RSpec.describe 'User show page', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'SteveEmmanuel',
                              photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'I am steve a fine brave african man that loves coding', post_counter: 0)
    @second_user = User.create(name: 'MilkyNwoye',
                               photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'A medical lab scientist and tech guru from Gambia.', post_counter: 0)
    @first_post = Post.create(author: @first_user, title: 'Family health', text: 'The current health state of the Nigeria people',
                              comment_counter: 0,
                              likes_counter: 0)
    @second_post = Post.create(author: @first_user, title: 'Teens right', text: 'teachers need to respect teenagers', comment_counter: 0,
                               likes_counter: 0)
    @third_post = Post.create(author: @first_user, title: 'Divorce', text: 'marriages end daily in Nigeria', comment_counter: 0,
                              likes_counter: 0)
    @comment = Comment.create(post: @first_post, author: @first_user, text: 'lets make this blog come alive')
  end
  describe 'user show page' do
    before(:each) do
      visit user_path(@first_user)
    end
    it 'I can see the user\'s profile picture.' do
      expect(page).to have_css('.profile')
    end
    it 'I can see the user\'s username.' do
      expect(page).to have_content(@first_user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 3'
    end
    it 'I can see the user\'s bio.' do
      expect(page).to have_content(@first_user.bio)
    end
    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content(@first_post.text)
      expect(page).to have_content(@second_post.text)
      expect(page).to have_content(@third_post.text)
    end
    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_selector("a[href='#{user_posts_path(@first_user)}']")
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      find("a[href='#{user_post_path(@first_user, @first_post)}']").click
      expect(page).to have_current_path(user_post_path(@first_user, @first_post))
    end
    it "When I click to see all posts, it redirects me to the user's post's index page." do
      find("a[href='#{user_posts_path(@first_user)}']").click
      expect(page).to have_current_path(user_posts_path(@first_user))
    end
  end
end
