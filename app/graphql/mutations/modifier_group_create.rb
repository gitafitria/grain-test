# frozen_string_literal: true

module Mutations
  class ModifierGroupCreate < BaseMutation
    description "Creates a new modifier_group"

    field :modifier_group, Types::ModifierGroupType, null: false

    argument :modifier_group_input, Types::ModifierGroupInputType, required: true

    def resolve(modifier_group_input:)
      modifier_group = ::ModifierGroup.new(**modifier_group_input)
      raise GraphQL::ExecutionError.new "Error creating modifier_group", extensions: modifier_group.errors.to_hash unless modifier_group.save

      { modifier_group: modifier_group }
    end
  end
end
