Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :countries
      resources :assets
      resources :segments
      resources :stocks
    end
  end
end
