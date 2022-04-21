Rails.application.routes.draw do
  
  get '/help', to:'static_pages#help'
  get 'events/index'
  get '/home', to:'static_pages#home' 

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    root "users/sessions#new"
  end

  resources :users, only: [:index, :show] 
  
  resources :events, only: [:index, :new, :create]
  resources :appoints
  # 調査結果変更用
  resources :appoints do
    member do
      get :edit_result
    end
  end
end
