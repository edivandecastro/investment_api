Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :countries
      resources :assets
      resources :sectors
      resources :stocks
      resources :user_assets
      resources :users do
        resources :stocks

        post 'position_import', on: :member
      end
    end
  end
end
