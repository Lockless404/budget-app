class Group < ApplicationRecord
  belongs_to :user
  has_many :group_purchases, dependent: :destroy
  has_many :purchases, through: :group_purchases
end
