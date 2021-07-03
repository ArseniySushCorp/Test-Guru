Rails.application.routes.draw do
  get 'users/new'
  root to: 'tests#index'

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
