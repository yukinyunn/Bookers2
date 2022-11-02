Rails.application.routes.draw do
  get 'uesrs/show'
  get 'uesrs/edit'
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'

end
