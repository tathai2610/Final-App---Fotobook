Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :photos
  resources :albums

  root to: "home#discover_photo"
  get 'discover/photo', to: 'home#discover_photo'
  get 'discover/album', to: 'home#discover_album'
  get 'feed/photo', to: 'home#feed_photo'
  get 'feed/album', to: 'home#feed_album'

end
