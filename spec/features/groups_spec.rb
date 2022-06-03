require 'rails_helper'

RSpec.describe 'Groups#index page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Mphatso Lichapa', photo: 'photo.jpg', email: 'mphatso@mail.com', password: 'password')
    @group = Group.create!(name: 'Utilities', icon: 'water_meter.pgp', user_id: @user.id)
    @entity = Entity.create!(name: 'water', amount: 60, user_id: @user.id, group_id: @group.id)
    visit new_user_session_path
    fill_in 'Email', with: 'mphatso@mail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'Has be redirected to category page' do
    expect(page).to have_content('Categories')
    expect(page).to have_content('Utilities')
    expect(page).to have_button(type: 'submit')
    expect(page).to have_link(href: '/groups/new')
  end

  scenario 'Click add new category link' do
    click_link 'New Category'
    expect(page).to have_content('New Category')
    expect(page).to have_button(type: 'submit')
  end
end
