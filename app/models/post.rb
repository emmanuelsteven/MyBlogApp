class Post < ApplicationRecord
  # associations
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # callback
  # after_save :update_user_posts_counter
  after_initialize :set_default

  # methods

  after_create :increment_post_counter
  before_destroy :decrement_post_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # def update_user_posts_counter
  #   author.update(post_counter: author.posts.count)
  # end

  private

  def increment_post_counter
    author.increment!(:post_counter)
  end

  def decrement_post_counter
    author.decrement!(:post_counter)
  end

  def set_default
    self.comment_counter ||= 0
    self.likes_counter ||= 0
  end
end