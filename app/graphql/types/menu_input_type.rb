# frozen_string_literal: true

module Types
  class MenuInputType < Types::BaseInputObject
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :state, String, required: false
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
