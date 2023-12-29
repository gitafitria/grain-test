# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject

    # ==== Menu ====
    field :menus, [Types::MenuType], null: false
    def menus
      Menu.all
    end

    field :menu, Types::MenuType, null: false do
      argument :id, String, required: true
    end
    def menu(id:)
      Menu.find(id)
    end

    # ==== Section ====
    field :sections, [Types::SectionType], null: false
    def sections
      Section.all
    end

    field :section, Types::SectionType, null: false do
      argument :id, String, required: true
    end
    def section(id:)
      Section.find(id)
    end

    # ==== Item ====
    field :items, [Types::ItemType], null: false
    def items
      Item.all
    end

    field :item, Types::ItemType, null: false do
      argument :id, String, required: true
    end
    def item(id:)
      Item.find(id)
    end

    field :products, [Types::ProductType], null: false
    def products
      Product.all
    end

    field :product, Types::ProductType, null: false do
      argument :id, String, required: true
    end
    def product(id:)
      Product.find(id)
    end

    field :components, [Types::ComponentType], null: false
    def components
      Component.all
    end

    field :component, Types::ComponentType, null: false do
      argument :id, String, required: true
    end
    def component(id:)
      Component.find(id)
    end

    # ==== ModifierGroup ====
    field :modifier_groups, [Types::ModifierGroupType], null: false
    def modifier_groups
      ModifierGroup.all
    end

    field :modifier_group, Types::ModifierGroupType, null: false do
      argument :id, String, required: true
    end
    def modifier_group(id:)
      ModifierGroup.find(id)
    end
  end
end
