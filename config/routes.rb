Rails.application.routes.draw do

  post 'users' => 'users#create'
  post 'user_token' => 'user_token#create'
  resources :products

end
