Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, only: %i[new create edit update]
  get 'edit', to: 'users#edit'
end
