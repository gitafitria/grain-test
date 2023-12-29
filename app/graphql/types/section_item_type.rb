# frozen_string_literal: true

module Types
  class SectionItemType < Types::BaseObject
    field :id, ID, null: false
    field :section_id, String, null: false
    field :item_id, String, null: false
    field :display_order, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :item, Types::ItemType, null: false
    def item
      object.item
    end

    field :section, Types::SectionType, null: false
    def section
      object.section
    end
  end
end
