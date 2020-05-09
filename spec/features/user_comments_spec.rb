require 'rails_helper'

RSpec.feature 'Posts comments', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'

    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'

    within(first('.post')) do
      find('a').click
    end
  end
  
  scenario 'User can add comment' do
    fill_in 'comment[content]', with: 'This is a comment'
    click_on 'Add comment'
    expect(first('.comment')).to have_content 'This is a comment'
  end

  scenario 'User can edit comment' do
    fill_in 'comment[content]', with: 'This is a comment'
    click_on 'Add comment'
    within(first('.comment')) do
      click_on 'Edit'
    end
    fill_in 'comment[content]', with: 'This is different content'
    click_on 'Update'
    expect(first('.comment')).to have_content 'This is different content'
  end
end
