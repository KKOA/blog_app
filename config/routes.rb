Rails.application.routes.draw do
  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles
  # Routes generated from above command
  # Prefix        Verb      URI Pattern                  Controller#Action
  # root          GET       /                            articles#index
  # articles      GET       /articles(.:format)          articles#index
  #               POST      /articles(.:format)          articles#create
  # new_article   GET       /articles/new(.:format)      articles#new
  # edit_article  GET       /articles/:id/edit(.:format) articles#edit
  # article       GET       /articles/:id(.:format)      articles#show
  #               PATCH     /articles/:id(.:format)      articles#update
  #               PUT       /articles/:id(.:format)      articles#update
  #               DELETE    /articles/:id(.:format)      articles#destroy
end
