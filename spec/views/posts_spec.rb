require 'rails_helper'

RSpec.describe 'User post index page', type: :system do
  before(:each) do
    @user = User.first
    @post = Post.first
  end
  it 'I can see the user\'s profile picture' do
    visit posts_path(@user)
    expect(find('img')['src']).to include @user.photo
  end
  it 'I can see the user\'s username.' do
    visit user_path(@user)
    expect(page).to have_content @user.name
  end
  it 'I can see the number of posts the user has written.' do
    visit posts(@user)
    expect(page).to have_content 'Number of Posts:8'
  end
  it 'I can see a post\'s title.' do
    visit posts_path(@user)
    expect(page).to have_content('Kinuthia', normalize_ws: true)
  end
  it 'I can see some of the post\'s body.' do
    visit posts_path(@user)
    expect(page).to have_content 'This is my first post'
  end
  it 'I can see how many comments a post has.' do
    visit posts_path(@user)
    expect(page).to have_content(/Comments:12/i, normalize_ws: true)
  end
  it 'I can see how many likes a post has.' do
    visit posts_path(@user)
    expect(page).to have_content(/Likes: 0/i)
  end
  it 'When I click on a post, it redirects me to that post\'s show page.' do
    visit posts_path(@user)
    click_link 'Hello'
    expect(page).to have_content 'This is my first post'
  end
end
