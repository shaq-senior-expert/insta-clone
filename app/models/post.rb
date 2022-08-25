class Post < ApplicationRecord
  # With default scopes, we can change/specify how records are retrieved by default from Active Record database. Any subsequent queries to the database will be retrieved/rendered following the default scope definition.
  default_scope { order created_at: :desc }
  # mount_uploader :image, ImageUploader
  before_create :set_active, :set_total_likes

  validates :description, :image, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  scope :active, -> { where active: true }

  def set_active
    self.active = true
  end

  def set_total_likes
    self.total_likes = 0
  end
end
