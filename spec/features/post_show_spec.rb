require 'rails_helper'
RSpec.describe 'post show page', type: :feature do
    before(:each) do
        @first_user = User.create(name: 'SteveEmmanuel', photo:'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio:'I am steve a fine brave african man that loves coding', post_counter:0)
        @second_user = User.create(name: 'MilkyNwoye', photo:'https://img.freepik.com/premium-photo/close-up-cartoon-character-wearing-headphones-jacket-generative-ai_958098-24830.jpg?w=1480', bio:'A medical lab scientist and tech guru from Gambia.', post_counter:0)
        @first_post = Post.create(author: @first_user, title: 'Family health', text: 'The current health state of the Nigeria people',
         comment_counter: 0,
        likes_counter: 0)
        @second_post = Post.create(author: @first_user, title: 'Teens right', text: 'teachers need to respect teenagers', comment_counter: 0,
        likes_counter: 0)
        @third_post = Post.create(author: @first_user, title: 'Divorce', text: 'marriages end daily in Nigeria', comment_counter: 0,
        likes_counter: 0)
        @comment = Comment.create(post: @first_post, author: @first_user, text: 'lets make this blog come alive' )
    end
    describe 'post show page' do
        before(:each) do
          visit user_post_path(@first_user, @first_post)
        end
        it 'I can see the post\'s title.' do
            expect(page).to have_content("#{@first_post.title}")
        end
        it 'I can see who wrote the post.' do
            expect(page).to have_content(@first_post.author.name)
        end
        it 'I can see how many comments it has.' do
            expect(page).to have_content(@first_post.comment_counter)
        end
        it 'I can see how many likes it has.' do
            expect(page).to have_content(@first_post.likes_counter)
        end
        it 'I can see the post body.' do
            expect(page).to have_content(@first_post.text)
        end
        it 'I can see the username of each commentor.' do
            expect(page).to have_content(@first_user.name)
        end
        it 'I can see the comment each commentor left.' do
            expect(page).to have_content(@comment.text)
        end
    end
end
