class Purchase < ApplicationRecord
  belongs_to :user
  has_many :group_purchases, class_name: 'GroupPurchase', foreign_key: 'purchases_id', dependent: :destroy
  has_many :groups, through: :group_purchases
end
