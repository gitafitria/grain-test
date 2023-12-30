# frozen_string_literal: true

module Types
  class MenuSectionInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :menu_id, String, required: false
    argument :section_id, String, required: false
    argument :display_order, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
