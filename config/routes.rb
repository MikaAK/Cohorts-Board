Rails.application.routes.draw do

  root "welcome#index"

  # admin namespace will have it's own controllers for CRUD of
  # cohorts and employers namespace will have it's own as well (read only).
  # They make share partials b/w them.
  namespace :students do
    root 'student#index'
    get '/authenticate/:uuid' => 'sessions#create'
    resources :students, only: [:show, :update]
  end

  namespace :employers do
    root 'cohorts#index'
    get '/authenticate/:uuid' => 'sessions#create'
    resources :inquiries, only: [:create]
  end

  # ADMIN
  # -----
  namespace :admin do
    root 'students#index'
    resources :employers, only: [:create]
    resources :students, only: [:show, :create]
    resources :cohorts, only: [:index, :create]
  end
end
