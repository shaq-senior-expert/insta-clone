class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :comment, :user_id, :post_id

  after_create :increase_post_comment_counter
  after_destroy :decrease_post_comment_counter

  attr_accessor :return_to

  private

  def increase_post_comment_counter
    Post.find_by_id(self.post_id).increment(:total_comments).save
  end

  def decrease_post_comment_counter
    Post.find_by_id(self.post_id).decrement(:total_comments).save if Post.find_by_id(self.post_id)
  end
end
