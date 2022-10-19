module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_users, [UserType], null: false, description: 'ユーザー一覧取得'

    def all_users
      User.all
    end

    field :user, UserType, 'ユーザー詳細取得' do
      argument :id, ID
    end

    def user(id:)
      User.find(id)
    end
  end
end
