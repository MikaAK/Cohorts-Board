Rails.application.routes.draw do
  root "cohorts#index"

  get 'cohorts/uuid=:uuid', to: 'cohorts#show'

  resources :cohorts, only: [:index, :create, :show]
end
