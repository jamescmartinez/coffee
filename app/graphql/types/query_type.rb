module Types
  class QueryType < GraphQL::Schema::Object
    field :groups, [GroupType], null: false do
      argument :id, ID, required: false
    end

    def groups(id: nil)
      return Group.all unless id
      [Group.friendly.find(id)]
    end
  end
end
