require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    @user = User.create!(name: 'Mphatso Lichapa', photo: 'photo.jpg', email: 'mphatso@mail.com', password: 'password')
    @group = Group.create!(name: 'Utilities', icon: 'water_meter.pgp', user_id: @user.id)
    Entity.create!(name: 'water', amount: 60, user_id: @user.id, group_id: @group.id)
  end
  before(:each) { subject.save }

  it 'should check validity ' do
    expect(subject).to be_valid
  end

  it 'should always have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'it should always have amount present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'it should always have user present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'it should always have group present' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have the name water' do
    expect(subject.name).to eql('water')
  end

  it 'should have the amount 60' do
    expect(subject.amount).to eql(60)
  end

  it 'should have amount equal to or greater than 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end

  it 'should be an integer' do
    subject.amount = 'sixty'
    expect(subject).to_not be_valid
  end
end
