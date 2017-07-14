Rails.application.routes.draw do
  devise_for :users
  get 'posts/', to: 'posts#index'

  get 'posts/new'

  post 'posts/', to: 'posts#create'

  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
