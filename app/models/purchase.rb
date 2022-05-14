class Purchase < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  has_many :group_purchases, class_name: 'GroupPurchase', foreign_key: 'purchases_id', dependent: :destroy
  has_many :groups, through: :group_purchases
end
