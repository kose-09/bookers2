Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:show, :index, :edit, :update, :destroy, :create] do
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  get 'home/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
