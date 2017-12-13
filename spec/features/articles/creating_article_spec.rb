require 'rails_helper'
RSpec.feature 'Creating article' do
  scenario 'User create a new article' do
    visit '/'
    click_link 'New Article'
    fill_in 'Title', with: 'Creating a blog'
    fill_in 'Body', with: 'Lorem'
    click_button 'Save Article'
    expect(page).to have_content('Article has been created')
    expect(page.current_path).to eq(articles_path)
  end
  scenario 'User fails to create a new article' do
    visit '/'
    click_link 'New Article'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Save Article'
    expect(page).to have_content('Article has not been created')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end