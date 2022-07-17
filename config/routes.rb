Rails.application.routes.draw do
  resources :people do
    collection do
      get 'after_edit'
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "people#index"
end
