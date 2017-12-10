require 'rails_helper'
RSpec.feature 'Delete articles' do
  before do
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.' * 20
    )
  end
  scenario 'User deletes an article' do
    visit '/'
    title = @article1.title
    click_link @article1.title
    click_link 'Delete Article'
    expect(page).to have_content('Article has been Deleted')
    expect(page.current_path).to eq(articles_path)
    expect(page).to_not have_content(title)
  end
end
