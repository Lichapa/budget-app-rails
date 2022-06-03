require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do 
    @user = User.create!(name: 'Mphatso Lichapa', photo: 'photo.jpg', email: 'mphatso@mail.com', password: 'password')
    Group.create!(name: 'utilities', icon: 'meter.pgp', user_id: @user.id)
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
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'it should always have user present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have the name utilities' do
    expect(subject.name).to eql('utilities')
  end

  it 'should have the icon meter.pgp' do
    expect(subject.icon).to eql("meter.pgp")
  end
end