Rails.application.routes.draw do
  post 'signup' => 'signup#create'

  namespace :api do
    namespace :v1 do
      resources :records
      resources :artists
    end
  end
end
