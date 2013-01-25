Csstrashman::Application.routes.draw do
  match 'styleguide' => 'styleguide#index'

  resources :styles, only: [:new, :create, :show]
  match 'styles/:id/done' => 'styles#done?'
  root to: "styles#new"
end
