Chartclips::Application.routes.draw do
  devise_for :users
  resources :clips
  root 'clips#new'
end
