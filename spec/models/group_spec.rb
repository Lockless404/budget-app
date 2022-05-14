require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'test for the group model should pass' do
    new_user = User.new(name: 'Hamza', email: 'hamza@yahoo.com', password: '123456')
    Purchase.new(user: new_user, name: 'filter', amount: 600)
    subject do
      Group.new
    end

    before { subject.save }

    it 'should be inavlid because text is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be inavlid because icon is nil' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid because name and icon are not nil' do
      subject.user = new_user
      subject.name = 'Car'
      subject.icon = 'icon.png'
      expect(subject).to be_valid
    end

    it 'should be inavlid because name is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid because name is nil' do
      subject.user = new_user
      subject.name = 'Car'
      subject.icon = 'icon.png'
      expect(subject).to be_valid
    end
  end
end
