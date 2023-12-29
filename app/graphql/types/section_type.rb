# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    field :identifier, String, null: false
    field :label, String
    field :description, String
    field :display_order, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :menus, [Types::MenuType], null: false
    def menus
      object.menus
    end

    field :menu_sections, [Types::MenuSectionType], null: false
    def menu_sections
      object.menu_sections
    end

    field :items, [Types::ItemType], null: false
    def items
      object.items
    end

    field :section_items, [Types::SectionItemType], null: false
    def section_items
      object.section_items
    end
  end
end
