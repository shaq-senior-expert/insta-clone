class Follower < ApplicationRecord
  validates_uniqueness_of :follower_id, scope: :following_id
  belongs_to :followee, class_name: :User, foreign_key: :following_id
  belongs_to :follower, class_name: :User, foreign_key: :follower_id
end
