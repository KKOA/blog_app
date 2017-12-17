require 'rails_helper'
RSpec.feature 'Test infrastructure' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    login_as(@user1)
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.' * 2,
      user_id: @user1.id
    )
  end
  scenario 'Cancel adding new article' do
    visit '/articles/new'
    click_link 'Cancel'
    expect(page).to have_content(@article1.title)
    expect(page.current_path).to eq(articles_path)
  end
  scenario 'User return to articles' do
    visit "/articles/#{Article.first.id}"
    click_link 'View Articles'
    expect(page).to have_content(@article1.title)
    expect(page.current_path).to eq(articles_path)
  end
  scenario 'Cancel Edit new article' do
    visit "/articles/#{Article.first.id}"
    title = @article1.title
    body = @article1.body
    click_link 'Edit Article'
    click_link 'Cancel'
    expect(page).to have_content(title)
    expect(page).to have_content(body)
    expect(page.current_path).to eq(article_path(@article1))
  end
  scenario 'Cancel Sign Up' do
    logout()
    visit '/users/sign_up'
    click_link 'Cancel'
    expect(page).to have_link('Sign Up')
    expect(page).not_to have_button('Register')
  end
  scenario 'Cancel Login Up' do
    logout()
    visit '/users/sign_in'
    click_link 'Cancel'
    expect(page).to have_link('Sign In')
    expect(page).not_to have_button('Log In')
  end
end
