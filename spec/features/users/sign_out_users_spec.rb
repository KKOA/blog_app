require 'rails_helper'
RSpec.feature 'Sign Out' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
  end
  scenario 'User log out of their account' do
    visit '/'
    click_link 'Sign Out'
    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("Signed in as #{@user1.email}")
    expect(page).to have_link("Sign Up")
    expect(page).to have_link("Sign In")
    expect(page).not_to have_link("Sign Out")
  end

end
