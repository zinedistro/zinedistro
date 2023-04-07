Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  defaults format: :html do
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
end
