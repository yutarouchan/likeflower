class Like < ApplicationRecord
  belongs_to :variety
  belongs_to :user
  validates_uniqueness_of :variety_id, scope: :user_id
end
