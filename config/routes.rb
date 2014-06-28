Rails.application.routes.draw do

  root "cohorts#index"

  get '/authenticate/:uuid' => 'cohorts#index' # /employers/sessions#create (root within the namespace)
  post '/cohorts' => 'cohorts#create' # /admin/cohorts (use resources)

  post '/visitors' => 'visitors#create' # /admin/employers
  post '/visitors/inquire' => 'visitors#inquire' # /employers/inquiries#create

  # admin namespace will have it's own controllers for CRUD of cohorts and employers namespace will have it's own as well (read only). They make share partials b/w them.

  resources :students, only: [:show, :create, :update]
end
