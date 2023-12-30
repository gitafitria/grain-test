# frozen_string_literal: true

module Types
  class ModifierInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :item_id, String, required: false
    argument :modifier_group_id, String, required: false
    argument :display_order, Integer, required: false
    argument :default_quantity, Integer, required: false
    argument :price_override, Float, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
