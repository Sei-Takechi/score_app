class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true, allow_nil: true
end
