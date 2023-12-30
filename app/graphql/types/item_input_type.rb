# frozen_string_literal: true

module Types
  class ItemInputType < Types::BaseInputObject
    argument :identifier, String, required: false
    argument :type, String, required: false
    argument :label, String, required: false
    argument :description, String, required: false
    argument :price, Float, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
