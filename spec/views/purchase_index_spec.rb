require 'rails_helper'

RSpec.describe 'Group Show page', type: :feature do
  describe 'Group Show requirements' do
    before(:each) do
      User.create(
        name: 'Hamza',
        id: 1,
        email: 'hamza@yahoo.com',
        password: '123456'
      )

      users = User.all
      Group.create(user: users[0], name: 'car', icon: 'car.jpg')
      Group.create(user: users[0], name: 'fridge', icon: 'fridge.jpg')
      Purchase.create(user: users[0], name: 'fuel filter', amount: 300)
      Purchase.create(user: users[0], name: 'engine', amount: 400)
      groups = Group.all
      purchases = Purchase.all
      GroupPurchase.create(group: groups[0], purchase: purchases[0])
      GroupPurchase.create(group: groups[0], purchase: purchases[1])
      visit new_user_session_path
      fill_in 'user_email', with: 'hamza@yahoo.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit root_path
      click_on groups[0].name
      visit user_group_purchases_path(user_id: users[0].id, group_id: groups[0].id)
    end

    it 'Expect show page to have purchase name' do
      users = User.all
      groups = users[0].groups
      group_purchases = groups[0].group_purchases
      group_purchases.each do |eq|
        expect(page).to have_content(eq.purchase.name)
      end
    end

    it 'Expect show page to have purchase amount' do
      users = User.all
      groups = users[0].groups
      group_purchases = groups[0].group_purchases
      group_purchases.each do |eq|
        expect(page).to have_content(eq.purchase.amount)
      end
    end
  end
end
