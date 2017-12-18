require 'rails_helper'
RSpec.feature 'Edit articles' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    login_as(@user1)
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.' * 20,
      user_id: @user1.id
    )
  end
  scenario 'Logged in owner edits an article' do
    visit '/'
    click_link @article1.title
    click_link 'Edit Article'
    fill_in 'Title', with: 'Creating a blog'
    fill_in 'Body', with: 'Lorem'
    click_button 'Save Article'
    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article1))
  end
  scenario 'Logged in owner fails to edits an article' do
    visit '/'
    click_link @article1.title
    click_link 'Edit Article'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Save Article'
    expect(page).to have_content('Article has not been updated')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
    expect(current_path).to eq(article_path(@article1))
  end
  scenario 'Non logged in user cannot edits an article' do
    logout()
    visit '/'
    click_link @article1.title
    expect(page).not_to have_link('Edit Article')
  end
  scenario 'Non owner cannot edit anothers\' article' do
    logout()
    @user2 = User.create!(email: 'samuel@example.com', password: 'password')
    login_as(@user2)
    visit '/'
    click_link @article1.title
    expect(page).not_to have_link('Edit Article')
  end
end
