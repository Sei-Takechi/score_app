class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :file, UploadPdffileUploader

  # validates :user_id, presence: true
  # validates :post, presence: true
  # validates :content, presence: true, length: { maximum: 400 }
end
