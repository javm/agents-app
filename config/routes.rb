Rails.application.routes.draw do
  resources :agents
  resources :call_detail_records
  resources :messages
  resources :calls
  resources :contacts
  resources :users
  resources :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/accounts/:id/contacts', to: 'accounts#contacts'
end
