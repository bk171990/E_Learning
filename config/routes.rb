Rails.application.routes.draw do
  get 'enquiries/index'

  get 'enquiries/create'

  resources :questions do
   member do
    get :option
   end
  end

  resources :payments do
    member do
    get :show_payment
      get :confirm_to_pay
  end
end

  resources :queries do
    resources :answers
  end
  resources :enquiries
  resources :answers
  resources :question_types
  resources :coupon_courses
  resources :courses do

    collection do
      get :student_courses
    end
  end
  resources :reports do 
    collection do
      get :select, :report
    end
  end

  resources :courses do
    resources :coupons
  end
  resources :coupons
  resources :students do 
  end
  resources :admins
  devise_for :users, controllers: { registrations: 'registrations' }
  as :user do
        get '/users/sign_out' => 'devise/sessions#destroy'
        get 'sign_in' => 'devise/sessions#new'

      end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    devise_for :admins, :skip => :sessions
  root 'home#dashboard'

  resources :home do
        collection do
          get :dashboard
          get 'about'
          get 'index'
          get 'contact'
          get 'courses'
          get 'login'
          get 'blog'
          get 'register'
          get 'our_team'
          get 'course1'
          
        end
      end


  resources :users do
     member do
      get :change_password
      patch :update_password
    end
  end

    match '/payu_callback' => 'payments#payu_return', :via => [:get, :post], :as => 'payments_payu_return' 
        
end
