# frozen_string_literal: true

module Types
  class MenuSectionType < Types::BaseObject
    field :id, ID, null: false
    field :menu_id, String, null: false
    field :section_id, String, null: false
    field :display_order, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :menu, Types::MenuType, null: false
    def menu
      object.menu
    end

    field :section, Types::SectionType, null: false
    def section
      object.section
    end
  end
end
