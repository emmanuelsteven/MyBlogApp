class Comment < ApplicationRecord
  # associations
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  # Attributes
  attribute :text, :text

  # callbacks
  after_create :update_post_comments_counter
  after_destroy :update_post_comments_counter

  validates :text, presence: true, length: { maximum: 250 }

  # methods
  private

  def update_post_comments_counter
    post.update(comment_counter: post.comments.count)
  end
end
