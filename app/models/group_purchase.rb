class GroupPurchase < ApplicationRecord
  belongs_to :group, class_name: 'Group', foreign_key: 'groups_id'
  belongs_to :purchase, class_name: 'Purchase', foreign_key: 'purchases_id'
end
