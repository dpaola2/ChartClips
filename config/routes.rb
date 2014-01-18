Chartclips::Application.routes.draw do
  resources :clips
  root 'clips#index'
end
