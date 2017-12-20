require 'rails_helper'
# Handle request from user typing a url
# E.g. http://192.168.1.40:3000/articles/4
RSpec.describe 'Articles', type: :request do
  before do
    @user1 = User.create!(email: 'john@example.com', password: 'password')
    @user2 = User.create!(email: 'sam@example.com', password: 'password')
    @article1 = Article.create!(
      title: 'The first article',
      body: 'Lorem ipsum dolor sit amet, consectetur.' * 20,
      user_id:@user1.id
    )
  end
  describe 'GET /articles/:id/edit' do
    context 'with non-signed in user' do
      before do
        get "/articles/#{@article1.id}/edit"
      end
      it 'cannot edit articles' do
        expect(response.status).to eq 302
        flash_message = 'You need to sign in or sign up before continuing.'
        expect(flash[:alert]).to eq flash_message
      end
    end
    context 'with non owner in user' do
      before do
        login_as(@user2)
        get "/articles/#{@article1.id}/edit"
      end
      it 'cannot edit article' do
        expect(response.status).to eq 302
        flash_message = 'Only the article owner can edit this article'
        expect(flash[:alert]).to eq flash_message
      end
    end
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
