# frozen_string_literal: true

module Mutations
  class ModifierUpdate < BaseMutation
    description "Updates a modifier by id"

    field :modifier, Types::ModifierType, null: false

    argument :id, ID, required: true
    argument :modifier_input, Types::ModifierInputType, required: true

    def resolve(id:, modifier_input:)
      modifier = ::Modifier.find(id)
      raise GraphQL::ExecutionError.new "Error updating modifier", extensions: modifier.errors.to_hash unless modifier.update(**modifier_input)

      { modifier: modifier }
    end
  end
end
