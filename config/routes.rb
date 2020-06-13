Rails.application.routes.draw do

  # Authentication
  post 'users' => 'users#create'
  post 'user_token' => 'user_token#create'
  get 'user_info/:id' => 'users#show'
  get 'user_info' => 'users#show'

  # Products CRUD
  resources :products
  get 'user/products' => 'products#user_products'
  put 'user/products/:id' => 'products#activation'

  # Credit Card CRUD
  get 'credit_card' => 'credit_cards#show'
  post 'credit_card' => 'credit_cards#create'
  put 'credit_card' => 'credit_cards#update'

  # Address CRUD
  get 'address' => 'addresses#show'
  post 'address' => 'addresses#create'
  put 'address' => 'addresses#update'

  # Purchase flow
  post 'buy/:id' => 'purchase#buy'
  get 'purchases' => 'purchase#index'
  get 'purchases/:id' => 'purchase#show'
  get 'sells' => 'purchase#index_sells'
  patch 'sells/:id' => 'purchase#update'
  delete 'purchases/:id' => 'purchase#delete'
end
