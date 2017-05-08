Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages
  resources :playitems
  resources :playlists
  resources :places
  resources :devices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
