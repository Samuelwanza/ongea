class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def update_posts_counter
    puts 'testing posts count'
    author.update(posts_counter: author.posts.count)
  end

  public

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
