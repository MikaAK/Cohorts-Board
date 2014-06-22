Rails.application.routes.draw do
  root "cohorts#index"

  get 'cohorts/:id/uuid=:uuid', to: 'cohorts#show'

  resources :cohorts, only: [:index, :create, :show]
end
