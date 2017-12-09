require 'rails_helper'
RSpec.feature 'Edit articles' do
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
  scenario 'User edits an article' do
    visit '/'
    click_link @article2.title
    click_link 'Edit Article'
    fill_in 'Title', with: 'Creating a blog'
    fill_in 'Body', with: 'Lorem'
    click_button 'Save Article'
    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path)
  end
  scenario 'User fails to edits an article' do
    visit '/'
    click_link @article2.title
    click_link 'Edit Article'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Save Article'
    expect(page).to have_content('Article has not been updated')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
