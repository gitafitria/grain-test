# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :identifier, String, null: false
    field :type, String, null: false
    field :label, String
    field :description, String
    field :price, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :products, [Types::ItemType], null: false
    def products
      object.products
    end

    field :components, [Types::ItemType], null: false
    def components
      object.components
    end

    field :sections, [Types::SectionType], null: false
    def sections
      object.sections
    end

    field :section_items, [Types::SectionItemType], null: false
    def section_items
      object.section_items
    end

    field :modifiers, [Types::ModifierType], null: false
    def modifiers
      object.modifiers
    end

    field :modifier_groups, [Types::ModifierGroupType], null: false
    def modifier_groups
      object.modifier_groups
    end
  end
end
