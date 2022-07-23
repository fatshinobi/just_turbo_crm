Rails.application.routes.draw do
  resources :opportunities do
    collection do
      get 'after_edit'
    end
  end

  resources :companies do
    collection do
      get 'after_edit'
    end
  end

  resources :people do
    collection do
      get 'after_edit'
      get 'by_company/:company_id' => 'people#by_company'
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "people#index"
end
