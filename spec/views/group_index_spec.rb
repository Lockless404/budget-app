require 'rails_helper'

RSpec.describe 'Group Index page', type: :feature do
  describe 'Group Index requirements' do
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
    end

    it 'Log In, expect page to have username' do
      expect(page).to have_content('Categories')
    end

    it 'Log In, expect to see group name' do
      user = User.all
      groups = user[0].groups
      groups.each do |group|
        expect(page).to have_content(group.name)
      end
    end

    it 'Log In to the root page and see purchase amount for each Group' do
      users = User.all
      first_user = users[0]
      groups = first_user.groups
      groups.each do |group|
        total = 0
        group.group_purchases.each do |eq|
          total += eq.purchase.amount
        end
        expect(page).to have_content(total)
      end
    end

    it 'Log In, expect to click on name of first group' do
      users = User.all
      first_user = users[0]
      groups = first_user.groups
      group_name = groups[0].name
      click_link group_name
      expect(page).to have_current_path user_group_purchases_path(user_id: first_user.id, group_id: groups[0].id)
    end
  end
end
