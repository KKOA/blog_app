require 'rails_helper'
RSpec.feature 'Sign In' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
  end
  scenario 'With valid credinetials' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{@user1.email}")
    expect(page).not_to have_link('Sign Up')
    expect(page).not_to have_link('Sign In')
    expect(page).to have_link('Sign Out')
  end
  scenario 'With invalid credinetials' do
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Log In'
    expect(page).to have_content('Invalid login credentials')
  end
end
