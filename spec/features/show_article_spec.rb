require 'rails_helper'
RSpec.feature 'Show articles' do
  before do
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.'*20
    )
    @article2 = Article.create(
      title: 'The second article',
      body: 'Pellentesque ac ligula in tellus feugiat.'
    )
  end
  scenario 'User views an article' do
    visit '/'
    click_link @article2.title
    expect(page).to have_content(@article2.title)
    expect(page).not_to have_content(@article1.title)
  end
end
