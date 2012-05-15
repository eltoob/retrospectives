Retrospective::Application.routes.draw do
  root :to => 'welcome#index'
  resources :retros, only: [:create, :show, :update]
  resources :items, only: [:create, :update, :destroy]
  match "/health_check" => "welcome#health_check"
end
