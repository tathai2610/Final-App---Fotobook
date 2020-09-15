Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  default_url_options :host => 'localhost'

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#feed_photo', as: :authenticated_root
    end

    unauthenticated do
      root 'home#guest_feed_photo', as: :unauthenticated_root
    end
  end

  resources :users
  resources :photos
  resources :albums

  get 'guest-albums', to: 'home#guest_feed_album'
  get 'feed-albums', to: 'home#feed_album'
  get 'discover-photos', to: 'home#discover_photo'
  get 'discover-albums', to: 'home#discover_album'

  post 'follow', to: 'users#follow'
  post 'like', to: 'users#like'

end
