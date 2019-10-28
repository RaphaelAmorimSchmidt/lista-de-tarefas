Rails.application.routes.draw do
  root to: 'lists#index'
  devise_for :users
  resources :tasks, only: [:destroy, :edit, :update, :show]
  resources :list, except: :index do
    resources :tasks, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
