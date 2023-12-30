# frozen_string_literal: true

module Types
  class SectionItemInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :section_id, String, required: false
    argument :item_id, String, required: false
    argument :display_order, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
