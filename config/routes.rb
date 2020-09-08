Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#feed', as: :authenticated_root
    end

    unauthenticated do
      root 'home#guest_feed', as: :unauthenticated_root
    end
  end

  resources :photos
  resources :albums

  get 'discover/photo', to: 'home#discover_photo'
  get 'discover/album', to: 'home#discover_album'

end
