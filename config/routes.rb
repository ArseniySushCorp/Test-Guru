Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root to: 'tests#index'

  get 'sign_up', to: 'users#new'
  get 'login', to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    get :start, on: :member
  end

  resources :passed_tests, only: %i[show update] do
    get :result, on: :member
  end
end
