DistroNew::Application.routes.draw do
  resources :zines
  resources :authors do
    member do
      get :zines
    end
  end
  root :to => 'zines#index'
end
