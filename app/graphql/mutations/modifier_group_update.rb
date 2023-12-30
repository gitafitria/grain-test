# frozen_string_literal: true

module Mutations
  class ModifierGroupUpdate < BaseMutation
    description "Updates a modifier_group by id"

    field :modifier_group, Types::ModifierGroupType, null: false

    argument :id, ID, required: true
    argument :modifier_group_input, Types::ModifierGroupInputType, required: true

    def resolve(id:, modifier_group_input:)
      modifier_group = ::ModifierGroup.find(id)
      raise GraphQL::ExecutionError.new "Error updating modifier_group", extensions: modifier_group.errors.to_hash unless modifier_group.update(**modifier_group_input)

      { modifier_group: modifier_group }
    end
  end
end
