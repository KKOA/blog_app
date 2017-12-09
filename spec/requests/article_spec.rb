require 'rails_helper'
# Handle request from user typing a url
# E.g. http://192.168.1.40:3000/articles/4
RSpec.describe 'Articles', type: :request do
  before do
    @article1 = Article.create(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.' * 20
    )
  end
  describe 'GET /articles/:id' do
    context 'with existing article' do
      it 'handles existing article' do
        get "/articles/#{@article1.id}"
        expect(response.status). to eq 200
        # 200 means page success found
      end
    end
    context 'with non-existing article' do
      it 'handles non-existing article' do
        get '/articles/xxxxx'
        expect(response.status). to eq 302
        flash_message = 'The article you are looking for could not be found'
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
end
