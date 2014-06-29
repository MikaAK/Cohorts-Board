Rails.application.routes.draw do

  root "welcome#index"

  # STUDENTS
  # --------
  namespace :students do
    resource :profile, only: [:show, :update], controller: :students
    get '/authenticate/:uuid' => 'sessions#create'
  end

  # EMPLOYERS
  # ---------
  namespace :employers do
    root 'cohorts#index'
    get '/authenticate/:uuid' => 'sessions#create'
    resources :inquiries, only: [:create]
    resources :students, only: [:show]
  end

  # ADMIN
  # -----
  namespace :admin do
    root 'cohorts#index'
    resources :employers, only: [:index, :create]
    resources :students, only: [:show, :create, :update]
    resources :cohorts, only: [:index]
  end
end
