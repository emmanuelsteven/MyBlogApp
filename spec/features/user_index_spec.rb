require 'rails_helper'
RSpec.describe 'User index page test', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'SteveEmmanuel',
                              photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'I am steve a fine brave african man that loves coding', post_counter: 0)
    @second_user = User.create(name: 'MilkyNwoye',
                               photo: 'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio: 'A medical lab scientist and tech guru from Gambia.', post_counter: 0)
  end
  describe 'User content' do
    before(:each) do
      visit users_path
    end
    it 'should see the username of all other users.' do
      User.all.each do |_user|
        expect(page).to have_content(@first_user.name)
        expect(page).to have_content(@second_user.name)
      end
    end
    it 'I can see the user\'s profile picture.' do
      expect(page).to have_css('.profile')
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 0')
    end
    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_link('SteveEmmanuel')
      expect(page).to have_current_path(user_path(@first_user))
    end
  end
end
