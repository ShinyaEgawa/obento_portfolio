class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validate :picture_size

private

  # アップロードされた画像のサイズをvalidateする
  def picture_size
    if picture.size > 5.megabytes # rubocop:disable Style/IfUnlessModifier
      errors.add(:picture, '5MB以下の画像をアップロードしてください')
    end
  end
end