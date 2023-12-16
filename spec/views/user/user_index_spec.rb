require 'rails_helper'

RSpec.describe 'user_index_path', type: :system do
  describe 'User_index_view' do
    before do
      @users = User.all
      visit users_path
    end

    it 'I can see the username of all other users.' do
      @users.each do |u|
        expect(page).to have_content u.name
      end
    end

    it 'I can see the user\'s profile picture' do
      @users.each do |u|
        within '.user-card', text: u.name do
          expect(find('img')['src']).to include u.photo
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
