Rails.application.routes.draw do
  namespace :api do
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'

    namespace :v1 do
      devise_for :user, class_name: Api::V1::User
      resources :countries
      resources :assets
      resources :sectors
      resources :stocks
      resources :user_assets
      resources :users do
        resources :stocks

        collection do
          post 'position_import'
          get 'patrimony'
          get 'stocks'
        end
      end
    end
  end
end
