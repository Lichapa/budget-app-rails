require 'rails_helper'

RSpec.describe 'Sign up page', type: :feature do
  before(:each) do
    visit new_user_registration_path
  end

  scenario 'go to sign up in page' do
    expect(page).to have_content('Sign up')
    expect(page).to have_button(type: 'submit')
    expect(page).to have_link(href: '/users/sign_in')
  end

  scenario 'empty fields' do
    click_button 'Sign up'
    expect(page).to have_content('4 errors prohibited this user from being saved:')
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'Valid email and password' do
    fill_in 'Email', with: 'mphatso@mail.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_name', with: 'Mphatso Lichapa'
    fill_in 'user_photo', with: 'Photo.jpg'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Mphatso')

    expect(page).to have_content('Categories')

    click_button 'Sign out'
    expect(page).to have_content('Budget App')
    expect(page).to have_link(href: '/users/sign_in')
  end
end
