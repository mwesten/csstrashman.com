Csstrashman::Application.routes.draw do
  match 'styleguide' => 'styleguide#index' if Rails.env.development?

  resources :styles, only: [:new, :create, :show]
  root to: "styles#new"
end
