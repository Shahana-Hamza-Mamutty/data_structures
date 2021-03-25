Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  

  # resources :todos do
  #   resources :items
  # end

  namespace :api do
    # v2, because `driver` was v1
    namespace :v1, defaults: { format: 'json' } do
      post 'auth/login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'
      resources :todos do
        resources :items
      end
    end
  end
  
end
