Rails.application.routes.draw do
  resources :conversion_histories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "conversion_histories#index"
end
