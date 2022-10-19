Rails.application.routes.draw do
  get 'health_check', to: 'application#health_check'

  scope :api, format: 'json' do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

      # Defines the root path route ("/")
      # root "articles#index"

      post "/graphql", to: "graphql#execute"
    end
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "api/v1/graphql"
  end
end
