class User < ApplicationRecord
  # associations
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  after_initialize :set_default

  def three_recent_posts
    post.order(created_at: :desc).limit(3)
  end

  private

  def set_default
    self.post_counter ||= 0
  end
end
