require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'user signs up through users/new form and sees their username' do
    visit 'users/new'
    fill_in 'name', with: 'Dave Dude'
    fill_in 'email', with: 'davedude@example.com'
    fill_in 'username', with: 'davedude'
    fill_in 'password', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'davedude'
  end
end