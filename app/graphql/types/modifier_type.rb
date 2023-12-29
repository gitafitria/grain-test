# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    field :id, ID, null: false
    field :item_id, String, null: false
    field :modifier_group_id, String, null: false
    field :display_order, Integer
    field :default_quantity, Integer
    field :price_override, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :item, Types::ItemType, null: false
    def item
      object.item
    end

    field :modifier_group, Types::ModifierGroupType, null: false
    def modifier_group
      object.modifier_group
    end
  end
end
