class Purchase < ApplicationRecord
  belongs_to :user
  has_many :group_purchases, dependent: :destroy
  has_many :groups, through: :group_purchases
end
