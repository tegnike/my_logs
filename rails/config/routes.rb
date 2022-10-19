Rails.application.routes.draw do
  get 'health_check', to: 'application#health_check'

  scope :api, format: 'json' do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"
    end
  end
end
