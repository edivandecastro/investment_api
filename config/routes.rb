Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :countries
      resources :assets
      resources :sectors
      resources :stocks
      resources :user_assets
      devise_for :user, class_name: Api::V1::User do
        resources :stocks

        post 'position_import', on: :member
        get 'patrimony', on: :member
      end
    end
  end
end
