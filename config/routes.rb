Rails.application.routes.draw do
  post   'signin'  => 'signin#create'
  delete 'signin'  => 'signin#destroy'
  post   'signup'  => 'signup#create'
  post   'refresh' => 'refresh#create'

  namespace :api do
    namespace :v1 do
      resources :records
      resources :artists
    end
  end

  root to: "home#index"
end
