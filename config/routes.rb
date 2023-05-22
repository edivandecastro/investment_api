Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :countries
      resources :assets
      resources :segments
      resources :stocks
      resources :user_stocks
    end
  end
end
