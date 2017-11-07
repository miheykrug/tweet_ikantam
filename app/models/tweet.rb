class Tweet < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :message, presence: true, length: { maximum: 140 }, :unless => Proc.new { |a| a.image? }

end
