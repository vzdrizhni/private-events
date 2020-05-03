require 'rails_helper'
require 'capybara/rails'

feature 'The signup process:' do
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

feature 'The signin process:' do
  scenario 'has a login user page' do
    visit(login_url)
    expect(page).to have_content('Email')
  end

  feature 'signing in a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Name', with: 'testing'
      fill_in 'Email', with: 'biscuits@gmail.com'
      click_on 'Create User'
      visit login_url
      fill_in 'Email', with: 'biscuits@gmail.com'
      click_button 'Log in'
    end

    scenario 'redirects to home page after signin' do
      expect(page).to have_content 'User: '
    end

    scenario 'shows username on the homepage after signing in' do
      expect(page).to have_content 'testing'
    end
  end
end
