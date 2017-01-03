Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :zines, only: [:show, :index]
  resources :authors do
    member do
      get :zines
    end
  end

  # zines
  get '/zines/:id/(:seo_title/by/:author_names)',
      controller: 'zines',
      action: 'show',
      as: 'zine_seo'

  root to: 'zines#index'
end
