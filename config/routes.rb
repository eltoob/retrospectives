Retrospective::Application.routes.draw do
  devise_for :users

  root :to => 'welcome#index'
  resources :retros, only: [:create, :show, :update] do
    member do
      put 'send_to_tracker'
    end
  end
  resources :items, only: [:create, :update, :destroy]
  resources :users do
    collection do
      get "dashboard"
    end
  end
  match "/health_check" => "welcome#health_check"
end
