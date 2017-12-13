require 'rails_helper'
RSpec.feature 'Sign Up' do
  scenario 'With valid credinetials' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'tom@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create Account'
    expect(page).to have_content("You have signed up successfully.")
  end
  scenario 'With invalid credinetials' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Create Account'
    expect(page).to have_content("You have not signed up successfully")
  end
end
