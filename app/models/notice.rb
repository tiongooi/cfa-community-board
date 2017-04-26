class Notice < ApplicationRecord
  belongs_to :user
  validates :title, :content, :presence => true

  mount_uploader :image, NoticeImageUploader
end
