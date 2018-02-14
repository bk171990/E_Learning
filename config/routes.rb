Rails.application.routes.draw do
  resources :options
  resources :examinations do 
    collection do      get :create_exam
      post :insert_exam
      get :insert_mark
      get :insert
      get :exam
      post :save_test
      get :question_paper
      post :save_test
      get :apply_exam
      get :publish_result
      get :display_result
      post :qualify_student
      get :qualified_student
       get :select_question_type
      get :option
      get :disp_time
    end
    member do
      get :show_question
    end
   
      resources :exam_questions
  end

  resources :exams
  get 'exam_questions/index'

  get 'exam_questions/new'

  resources :sub_courses
  get 'enquiries/index'

  get 'enquiries/create'

  

  resources :payments do
    member do
    get :show_payment
      get :confirm_to_pay
  end
end




  resources :exam_answers

  resources :sub_courses
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
      get :select, :report, :reference_report , :select_reference
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
