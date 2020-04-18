Rails.application.routes.draw do

  post 'users' => 'users#create'
  post 'user_token' => 'user_token#create'
  get 'user_info/:id' => 'users#show'
  get 'user_info' => 'users#show'
  resources :products
  get 'credit_card' => 'credit_cards#show'
  post 'credit_card' => 'credit_cards#create'
  put 'credit_card' => 'credit_cards#update'
  get 'address' => 'addresses#show'
  post 'address' => 'addresses#create'
  put 'address' => 'addresses#update'

  # Purchase flow
  post 'buy/:id' => 'purchase#buy'
  get 'purchases' => 'purchase#index'
  get 'purchases/:id' => 'purchase#show'
  get 'sells' => 'purchase#index_sells'
  patch 'sells/:id' => 'purchase#update'
end
