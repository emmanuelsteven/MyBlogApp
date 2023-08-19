class Post < ApplicationRecord
  # associations
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # callback
  after_save :update_user_posts_counter
  after_initialize :set_default

  # methods

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_posts_counter
    author.update(post_counter: author.posts.count)
  end

  private

  def set_default
    self.comment_counter ||= 0
    self.likes_counter ||= 0
  end
end
