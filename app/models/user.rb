class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :rizins, dependent: :destroy
         validates :name, presence: true
         validates :profile, length: { maximum: 200 }
         has_many :likes, dependent: :destroy
         has_many :rizins, dependent: :destroy
  has_many :liked_rizins, through: :likes, source: :rizin
  mount_uploader :image, ImageUploader
  def already_liked?(rizin)
    self.likes.exists?(rizin_id: rizin.id)
  end
end