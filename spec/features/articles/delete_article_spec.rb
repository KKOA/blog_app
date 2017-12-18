require 'rails_helper'
RSpec.feature 'Delete articles' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.' * 20,
      user_id: @user1.id
    )
  end
  scenario 'Logged in owner deletes an article' do
    login_as(@user1)
    visit '/'
    title = @article1.title
    click_link @article1.title
    click_link 'Delete Article'
    expect(page).to have_content('Article has been Deleted')
    expect(page.current_path).to eq(articles_path)
    expect(page).to_not have_content(title)
  end
  scenario 'User fails to deletes an article' do
    visit '/'
    click_link @article1.title
    expect(page).not_to have_link('Delete Article')
  end
  scenario 'Non owner cannot delete anothers\' article' do
    @user2 = User.create!(email: 'joshua@example.com', password: 'password')
    login_as(@user2)
    visit '/'
    title = @article1.title
    click_link @article1.title
    expect(page).not_to have_link('Delete Article')
  end
end
