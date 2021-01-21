class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :file, UploadPdffileUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :file, presence: true
  validates :title, presence: true, length: { maximum: 30 }

  # def self.search_posts(content)
  #   if content
  #     Post.where("title LIKE ?", "%#{content}%")
  #   else
  #     Post.all
  #   end
  # end

end
