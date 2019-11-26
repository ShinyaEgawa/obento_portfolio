class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  scope :search_by_keyword, -> (keyword) {
    where("microposts.content LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validate :picture_size

  #マイクロポストに対していいね！を行う
  def like(user)
    likes.create(user_id: user.id)
  end

  #マイクロポストのいいね！を解除する
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  #現在のユーザーがいいね！をしていたらtrueを返す
  def like?(user)
    like_users.include?(user)
  end

private

  # アップロードされた画像のサイズをvalidateする
  def picture_size
    if picture.size > 5.megabytes # rubocop:disable Style/IfUnlessModifier
      errors.add(:picture, '5MB以下の画像をアップロードしてください')
    end
  end
end
