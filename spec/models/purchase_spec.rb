require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'test for the purchase model should pass' do
    new_user = User.new(name: 'Hamza', email: 'hamza@yahoo.com', password: '123456')
    Group.new(user: new_user, name: 'filter', icon: 'icon.png')
    subject do
      Purchase.new
    end

    before { subject.save }

    it 'should be inavlid because text is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be inavlid because text is nil' do
      subject.user = new_user
      subject.name = 'Filter'
      subject.amount = 250
      expect(subject).to be_valid
    end

    it 'should be inavlid because text is nil' do
      subject.user = new_user
      subject.name = 'Filter'
      subject.amount = '-250'
      expect(subject).to_not be_valid
    end

    it 'should be inavlid because text is nil' do
      subject.user = new_user
      subject.name = 'Filter'
      subject.amount = -250
      expect(subject).to_not be_valid
    end
  end
end
