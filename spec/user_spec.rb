require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Tony', photo: 'https://www.linkedin.com/', bio: 'An intelligent and committed individual') }
  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'post_counter should be be greater than 0' do
    subject.posts_counter = -30
    expect(subject).to_not be_valid
  end
  it 'post_counter should- be an integer' do
    subject.posts_counter = 'not an integer'
    expect(subject).to_not be_valid
  end
  it 'expect recent posts to be 0 ' do
    expect(subject.recent_posts.length).to eq(0)
  end
end
