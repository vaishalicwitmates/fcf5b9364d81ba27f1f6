Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, path: '/api' do
    #resources :users, except: [ :edit, :new ]
    get 'users', to: 'users#index'
    get 'typeahead/:input', to: 'users#typeahead'
    post 'user', to: 'users#create'

    
    get 'user/:id', to: 'users#show'
    put 'user/:id', to: 'users#update'
    delete 'user/:id', to: 'users#destroy'
    
  end
end
