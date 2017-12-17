require 'rails_helper'
RSpec.feature 'Show articles' do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    # login_as(@user1)
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
  scenario 'User views an article' do
    visit '/'
    click_link @article2.title
    expect(page).to have_content(@article2.title)
    expect(page).not_to have_content(@article1.title)
    expect(page.current_path).to eq(article_path(@article2))
  end
end
