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
      click_on 'Submit'
    end

    scenario 'redirects to login page after signup' do
      expect(page).to have_content 'User was successfully created. testing please login.'
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
      click_on 'Submit'
      visit login_url
      fill_in 'Email', with: 'biscuits@gmail.com'
      click_button 'Beat it'
    end

    scenario 'redirects to home page after signin' do
      expect(page).to have_content 'testing'
    end

    scenario 'shows username on the homepage after signing in' do
      expect(page).to have_content 'testing'
    end
  end
end
