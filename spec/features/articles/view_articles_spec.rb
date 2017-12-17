require 'rails_helper'
RSpec.feature 'Listing articles' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    login_as(@user1)
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.' * 20,
      user_id: @user1.id
    )
    @article2 = Article.create(
      title: 'The second article',
      body: 'Pellentesque ac ligula in tellus feugiat.',
      user_id: @user1.id
    )
  end
  scenario 'No Articles exist' do
    Article.delete_all
    visit '/'
    expect(page).to have_content('No articles found')
    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article2.body)
  end
  scenario 'Articles exist' do
    visit '/'
    expect(@article1.title).to_not appear_before(@article2.title)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(@article2.body[0...497]).to appear_before(@article1.body[0...497])
  end
end
