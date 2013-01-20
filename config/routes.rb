Csstrashman::Application.routes.draw do
  match 'styleguide' => 'styleguide#index'

  resources :styles, only: [:new, :create, :show]
  root to: "styles#new"
end
