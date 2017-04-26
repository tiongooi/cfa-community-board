Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }


  resources :boards
  resources :notices

  resources :users do
    post 'add_postcode', on: :collection
  end

  resources :issues do
      resources :comments
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
