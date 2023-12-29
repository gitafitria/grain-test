# frozen_string_literal: true

module Types
  class MenuType < Types::BaseObject
    field :identifier, String, null: false
    field :label, String
    field :state, String, null: false
    field :start_date, GraphQL::Types::ISO8601Date
    field :end_date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :published, [Types::MenuType], null: false
    def published
      object.published
    end

    field :draft, [Types::MenuType], null: false
    def draft
      object.draft
    end

    field :menu_sections, [Types::MenuSectionType], null: false
    def menu_sections
      object.menu_sections
    end

    field :sections, [Types::SectionType], null: false
    def sections
      object.sections
    end
  end
end
