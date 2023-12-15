require 'rails_helper'
RSpec.describe 'Post show page', type: :system do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')

    @user2 = User.create(name: 'Alice', photo: 'https://unsplash.com/photos/xyz', bio: 'Alice\'s bio.')
    @comment1 = Comment.create(post: @post, user: @user2, text: 'Great post!')
  end

  it "I can see the post's title." do
    visit post_path(@user, @post)
    expect(page).to have_content 'Hello'
  end

  it 'I can see who wrote the post.' do
    visit post_path(@user, @post)
    expect(page).to have_content 'Tom'
  end

  it 'I can see how many comments it has.' do
    visit post_path(@user, @post)
    expect(page).to have_content 'Comments: 1'
  end

  it 'I can see how many likes it has.' do
    visit post_path(@user, @post)
    expect(page).to have_content 'Likes: 0'
  end

  it 'I can see the post body.' do
    visit post_path(@user, @post)
    expect(page).to have_content 'This is my first post'
  end

  it 'I can see the username of each commentor.' do
    visit post_path(@user, @post)
    expect(page).to have_content 'Alice'
  end

  it 'I can see the comment each commentor left.' do
    visit post_path(@user, @post)
    expect(page).to have_content 'Great post!'
  end
end
