Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :passed_tests, only: %i[show update] do
    get :result, on: :member
  end
end
