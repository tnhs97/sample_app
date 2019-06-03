class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.maximum_content_length}
  validate :picture_size

  default_scope ->{order(created_at: :desc)}

  mount_uploader :picture, PictureUploader

  private

  def picture_size
    return unless picture.size > Settings.maximum_upload_size.megabytes
    errors.add :picture, t("less_than_5mb")
  end
end
