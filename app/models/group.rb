class Group < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true

  has_many :group_purchases, class_name: 'GroupPurchase', foreign_key: 'groups_id', dependent: :destroy
  has_many :purchases, through: :group_purchases
end
