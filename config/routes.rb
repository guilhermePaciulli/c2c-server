Rails.application.routes.draw do

  resources :credit_cards

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

end
