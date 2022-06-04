require 'rails_helper'

RSpec.describe 'Splash screen', type: :feature do
  before(:each) do
    visit unauthenticated_root_path
  end

  describe 'tests for view splash' do
    it 'I can see the username and password inputs and the Submit button.' do
      expect(page).to have_content('Budget App')
      expect(page).to have_content('Sign in')
      expect(page).to have_link(href: '/users/sign_up')
    end
  end

  scenario 'go to sign in page' do
    click_link 'Sign in'

    expect(page).to have_content('Log in')
    expect(page).to have_link(href: '/users/sign_up')
  end
end
