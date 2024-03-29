Rails.application.routes.draw do
  
  root to: 'sessions#new'
  get '/help', to:'static_pages#help'
  get '/home', to:'static_pages#home' 

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:index, :show] 
  
  resources :events, only: [:index, :new, :create]
  resources :achievements
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :appoints
  # 調査結果変更用
  resources :appoints do
    member do
      get :edit_result
    end
  end

end
