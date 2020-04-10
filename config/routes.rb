Rails.application.routes.draw do

  resources :addresses
  post 'users' => 'users#create'
  post 'user_token' => 'user_token#create'
  get 'user_info/:id' => 'users#show'
  get 'user_info' => 'users#show'
  resources :products

end
