Rails.application.routes.draw do

  root "welcome#index"

  # STUDENTS
  # --------
  namespace :students do
    root 'cohorts#index'
    get '/authenticate/:uuid' => 'sessions#create'
    resources :students, only: [:show, :update]
  end

  # EMPLOYERS
  # ---------
  namespace :employers do
    root 'cohorts#index'
    get '/authenticate/:uuid' => 'sessions#create'
    resources :inquiries, only: [:create]
  end

  # ADMIN
  # -----
  namespace :admin do
    root 'cohorts#index'
    resources :employers, only: [:create]
    resources :students, only: [:show, :create]
    resources :cohorts, only: [:index, :create]
  end
end
