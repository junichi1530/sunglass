
class Rizin < ApplicationRecord
    belongs_to :user
    mount_uploader :image1, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
  end
  