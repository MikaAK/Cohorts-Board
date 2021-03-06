Rails.application.routes.draw do

  root "welcome#index"

  # STUDENTS
  # --------
  namespace :student do
    resource :profile, only: [:edit, :show, :update]
    get '/authenticate/:uuid' => 'sessions#create'
    post '/authenticate' => 'sessions#create'
  end

  # EMPLOYERS
  # ---------
  namespace :employers do
    root 'cohorts#index'
    get '/authenticate/:uuid' => 'sessions#create'
    post '/authenticate' => 'sessions#create'
    resources :inquiries, only: [:create]
    resources :students, only: [:show]
  end

  # ADMIN
  # -----
  namespace :admin do
    root 'cohorts#index'
    resources :employers, only: [:index, :create, :edit]
    resources :students, only: [:show, :create, :update, :edit]
    resources :cohorts, only: [:new, :create]
  end
end
