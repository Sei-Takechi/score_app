class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :file, UploadPdffileUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :file, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validate  :pdf_size

  private

    def pdf_size
      if file.size > 5.megabytes
        flash[:danger] = "ファイルサイズを５MBより小さくしてください"
      end
    end

end
