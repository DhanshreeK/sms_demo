Rails.application.routes.draw do
  resources :enquiries do 
    member do
      get :remark
      patch :update_remark
    end
  end

  resources :caste_categories
  resources :students do 
    collection do 
      get :view_all
    end
    member do
      get :show_student,:admission_receipt,:student_status
    end
  end
  resources :courses
  resources :course_types
  resources :unversity_attachments
  resources :universities
  resources :employees
  resources :centers
  devise_for :users, controllers: { registrations: 'registrations' }
  as :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end

  root 'home#dashboard'
  resources :general_settings
  
  resources :home do
    collection do 
    get :dashboard
    end
  end

  resources :users do
     member do
      get :change_password
      patch :update_password
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end