Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'home/about' => 'homes#about', as: 'about'

end
