class CreateGroupPurchase < ActiveRecord::Migration[7.0]
  def change
    create_table :group_purchases do |t|
      t.references :groups, null: false, foreign_key: { to_table: 'groups' }, index: true
      t.references :purchases, null: false, foreign_key: { to_table: 'purchases' }, index: true

      t.timestamps
    end
  end
end
