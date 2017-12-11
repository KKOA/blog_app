require 'rails_helper'
RSpec.feature 'Find articles' do
  before do
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.'
    )
    @article2 = Article.create(
      title: 'Laura',
      body: 'Mauris at gravida neque, eget mattis purus.'
    )
    @article3 = Article.create(
      title: 'Jenkins',
      body: 'Praesent eu enim et neque commodo gravida sed sed massa.
      Duis placerat sed odio sit amet interdum.'
    )
    @article4 = Article.create(
      title: 'Mars',
      body: 'Phasellus id rutrum lorem. Ut ornare eu justo non sodales.'
    )

  end

  scenario 'User does find matching article' do
    visit '/'
    fill_in 'term', with: 'blog'
    click_button 'Search'
    expect(page).to have_content('No articles found')
    expect(page).to have_link('View Articles')
  end
  scenario 'User find match articles' do
    visit '/'
    fill_in 'term', with: 'Mar'
    click_button 'Search'
    expect(page).to have_content('Phasellus id rutrum lorem. Ut ornare eu justo non sodales.')
    expect(page).to have_link('View Articles')
  end
end
