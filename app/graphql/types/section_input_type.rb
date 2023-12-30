# frozen_string_literal: true

module Types
  class SectionInputType < Types::BaseInputObject
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :description, String, required: false
    argument :display_order, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
