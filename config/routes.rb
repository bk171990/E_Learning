Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :home, path: '/', only: :index do 
        collection do
          get 'about'
          get 'contact'
          get 'courses'
          get 'login'
          get 'blog'
          get 'register'
          get 'our_team'
        end
      end
end
