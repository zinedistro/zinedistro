DistroNew::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :zines
  resources :authors do
    member do
      get :zines
    end
  end
  root :to => 'zines#index'
end
