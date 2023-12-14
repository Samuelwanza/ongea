require 'rails_helper'

RSpec.describe 'user_index_path', type: :system do
  describe 'User_index_view' do
    before do
      @users=User.all
      visit users_path
    end

    it 'I can see the username of all other users.' do
      @users.each do |u|
        expect(page).to have_content u.name
      end
    end

    it 'I can see the user\'s profile picture' do
        @users.each do |u|
          within ".user-card", text: u.name do
            expect(find("img")['src']).to include u.photo
          end
        end
    end

    it 'I can see the number of posts each user has written.' do
      @users.each do |u|
        expect(page).to have_content('Number of posts:')

        expect(page).to have_content u.posts_counter
      end
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      click_link @users[0].name
      expect(page).to have_content @users[0].name
    end
  end
end


RSpec.describe 'User index page', type: :system do
  describe 'User show page' do
    before(:each) do
      @user = User.first
      @post=Post.first

      visit user_path(@user)
    end

    it 'I can see the user"s profile picture' do
        expect(find("img")['src']).to include @user.photo
    end

    it 'I can see the user"s username.' do
      expect(page).to have_content @user.name
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(/Number of posts:8/i)
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



