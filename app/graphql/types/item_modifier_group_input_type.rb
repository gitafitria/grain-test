# frozen_string_literal: true

module Types
  class ItemModifierGroupInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :item_id, String, required: false
    argument :modifier_group_id, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
