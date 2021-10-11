Rails.application.routes.draw do
  resources :questions do
    resources :answer, only: [:new, :create]
  end

  root to: "questions#index"
end
