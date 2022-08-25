class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, through: :comments, dependent: :destroy
  has_many :followers, class_name: :Follower, foreign_key: :following_id, dependent: :destroy
  has_many :followings, class_name: :Follower, foreign_key: :follower_id, dependent: :destroy

  # mount_uploader :image, ImageUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.name.split(" ").first
      user.last_name = auth.info.name.split(" ").last
      user.username = auth.info.name.gsub(" ", "")
      user.image = auth.info.image
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def post_like(post_id)
    Like.find_by(post_id: post_id, user_id: self)
  end

  def self.all_liking_post(post_id)
    joins(:likes).where(likes: { post_id: post_id })
  end

  def self.followers_list(user_id)
    joins(:followers).where(followers: { following_id: user_id })
  end

  def self.followings_list(user_id)
    joins(:followers).where(followers: { follower_id: user_id })
  end

  def self.search(term)
    search_result = User.where("username LIKE ?", "%" + "#{term}" + "%")

    if search_result.length > 0
      search_result
    else
      User.all
    end
  end
end
