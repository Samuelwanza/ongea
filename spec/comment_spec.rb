require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.new(user_id: 1, post_id: 1, text: "We shall overcome") }
  before { subject.save }
  it 'update_comments_counter should  function' do
    expect { subject.send(:update_comments_counter) }
  end
end
