class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # associations
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  after_initialize :set_default

  validates :name, presence: true
  # validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def set_default
    self.post_counter ||= 0
  end
end
