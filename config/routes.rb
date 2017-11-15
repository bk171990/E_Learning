Rails.application.routes.draw do
  resources :students
  resources :admins
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    devise_for :admins, :skip => :sessions
  root 'home#index'

  resources :home do
        collection do
          get 'about'
          get 'index'
          get 'contact'
          get 'courses'
          get 'login'
          get 'blog'
          get 'register'
          get 'our_team'
        end
      end
end
