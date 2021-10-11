Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answer, only: [:new, :create]
  end

  root to: "questions#index"
end
