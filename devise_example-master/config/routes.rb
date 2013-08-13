DeviseExample::Application.routes.draw do




  devise_for :users, :admins


  get '/token' => 'home#token', as: :token
  post 'games/add_level'
  post 'games/remove_level'
  post 'games/save_scores'
  get '/stats/topofday'


  resources :home, only: :index
  resources :admins, only: :index
  resources :levels
  resources :games

  root 'home#index'

end
