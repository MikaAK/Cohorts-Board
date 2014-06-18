Rails.application.routes.draw do
  root "cohorts#index"
  resources :cohorts, only: [:index, :create, :show]
end
