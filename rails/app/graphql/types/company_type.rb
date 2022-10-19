# frozen_string_literal: true

module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :user, UserType, null: false, method: :user
    field :name, String, null: false
  end
end
