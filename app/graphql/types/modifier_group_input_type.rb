# frozen_string_literal: true

module Types
  class ModifierGroupInputType < Types::BaseInputObject
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :selection_required_min, Integer, required: false
    argument :selection_required_max, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
