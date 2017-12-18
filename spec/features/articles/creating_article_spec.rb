require 'rails_helper'
RSpec.feature 'Creating article' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    login_as(@user1) # Helper Method provide through Warden
  end
  scenario 'Logged in user create a new article' do
    visit '/'
    click_link 'New Article'
    # fill_in 'Title', with: 'Creating a blog'
    # fill_in 'Body', with: 'Lorem'
    my_article = {
      Title: 'Creating a blog',
      Body: 'Lorem'
    }
    fill_form(my_article)
    click_button 'Save Article'
    expect(page).to have_content('Article has been created')
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{@user1.email}")
  end
  scenario 'Loged in User fails to create a new article' do
    visit '/'
    click_link 'New Article'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Save Article'
    expect(page).to have_content('Article has not been created')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
  scenario 'Non login User fails to create a new article' do
    logout()
    visit '/'
    expect(page).not_to have_link('New Article')
  end
end
