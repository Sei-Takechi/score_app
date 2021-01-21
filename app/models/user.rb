class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_follows, class_name: "Follow",
                           foreign_key: "follower_id",
                           dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :passive_follows, class_name: "Follow",
                            foreign_key: "followed_id",
                            dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true, allow_nil: true

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user.id).destroy
  end

end
