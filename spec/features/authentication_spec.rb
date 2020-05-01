require 'rails_helper'
require 'capybara/rails'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit(new_user_url)
    expect(page).to have_content('New User')
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Name', with: 'testing'
      fill_in 'Email', with: 'biscuits@gmail.com'
      click_on 'Create User'
    end

    scenario 'redirects to user page after signup' do
      expect(page).to have_content 'User: '
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'testing'
    end
  end
end