require 'rails_helper'
RSpec.feature 'Test infrastructure' do
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
  scenario 'Cancel adding new article' do
    visit '/'
    click_link 'New Article'
    click_link 'Cancel'
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article1.title)
    expect(page.current_path).to eq(articles_path)
  end
  scenario 'User views an article' do
    visit '/'
    click_link @article2.title
    click_link 'View Articles'
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article1.title)
    expect(page.current_path).to eq(articles_path)
  end
end
