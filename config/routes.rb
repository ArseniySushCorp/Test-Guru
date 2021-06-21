Rails.application.routes.draw do
  root to: 'tests#index'

  get 'tests/:id/questions', to: 'tests#show'

  resources :tests do
    resources :questions, shallow: true
  end
end
