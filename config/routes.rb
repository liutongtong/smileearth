Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'welcome/add'

  resources :reviews
  resources :declarations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
