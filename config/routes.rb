Rails.application.routes.draw do
  post   'signin' => 'signin#create'
  delete 'signin' => 'signin#destroy'
  post   'signup' => 'signup#create'

  namespace :api do
    namespace :v1 do
      resources :records
      resources :artists
    end
  end
end
