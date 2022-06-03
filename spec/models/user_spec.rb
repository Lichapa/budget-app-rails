require 'rails_helper'

RSpec.describe User, type: :model do
  subject do 
    User.create!(name: 'Mphatso Lichapa', photo: 'photo.jpg', email: 'mphatso@mail.com', password: 'password')
  end

   before(:each) { subject.save }

  it 'should check validity ' do
    expect(subject).to be_valid
  end

  it 'should always have a name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'it should always have photo present' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'it should always have email present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'it should always have password present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'should have the name Mphatso Lichapa' do
    expect(subject.name).to eql('Mphatso Lichapa')
  end

  it 'should have the icon meter.pgp' do
    expect(subject.photo).to eql("photo.jpg")
  end

  it 'should match provided email' do
    expect(subject.email).to eql("mphatso@mail.com")
  end

  it 'should match provided password' do
    expect(subject.password).to eql("password")
  end
end