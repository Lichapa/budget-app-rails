require 'rails_helper'

RSpec.describe 'login screen', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  scenario 'go to sign in page' do
    expect(page).to have_content('Log in')
    expect(page).to have_button(type: 'submit')
    expect(page).to have_link(href: '/users/sign_up')
  end

  scenario 'empty email and password' do
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  scenario 'Valid email and password' do
    @user = User.create!(name: 'Omar', photo: 'photo.jpg', email: 'omara@gmail.com', password: '123455')
    fill_in 'Email', with: 'omara@gmail.com'
    fill_in 'Password', with: '123455'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Categories')
  end

  scenario 'click sign up' do
    click_link 'Sign up'
    expect(page).to have_content('Sign up')
    expect(page).to have_link(href: '/users/sign_in')
  end
end
