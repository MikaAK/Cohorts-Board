Rails.application.routes.draw do

  root "welcome#index"

  # STUDENTS
  # # --------
  # resource :students, only: [:show, :update, :create] do
  #   resource '' , controller: :students
  #   get '/authenticate/:uuid' => 'session#create'
  # end

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
    resources :employers, only: [:index, :create]
    resources :students, only: [:show, :create, :update]
    resources :cohorts, only: [:index]
  end
end
