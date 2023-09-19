class Like < ApplicationRecord
  belongs_to :user
  belongs_to :rizin
  validates_uniqueness_of :rizin_id, scope: :user_id
end
