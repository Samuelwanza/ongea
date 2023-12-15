require 'rails_helper'

RSpec.describe 'User show page', type: :system do
  describe 'User show page' do
    before(:each) do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')

      visit user_path(@user)
    end

    it 'I can see the user"s profile picture' do
      expect(find('img')['src']).to include @user.photo
    end

    it 'I can see the user"s username.' do
      expect(page).to have_content @user.name
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(/Number of posts:1/i)
    end

    it 'I can see the user"s bio' do
      expect(page).to have_content @user.bio
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_content(/See all posts/i)
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      visit post_path(@user, @post)
      expect(page).to have_content 'Like'
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      visit posts_path(@user)
    end
  end
end
