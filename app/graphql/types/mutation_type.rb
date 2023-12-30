# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :modifier_delete, mutation: Mutations::ModifierDelete
    field :modifier_update, mutation: Mutations::ModifierUpdate
    field :modifier_create, mutation: Mutations::ModifierCreate
    field :section_item_delete, mutation: Mutations::SectionItemDelete
    field :section_item_update, mutation: Mutations::SectionItemUpdate
    field :section_item_create, mutation: Mutations::SectionItemCreate
    field :menu_section_delete, mutation: Mutations::MenuSectionDelete
    field :menu_section_update, mutation: Mutations::MenuSectionUpdate
    field :menu_section_create, mutation: Mutations::MenuSectionCreate
    field :modifier_group_delete, mutation: Mutations::ModifierGroupDelete
    field :modifier_group_update, mutation: Mutations::ModifierGroupUpdate
    field :modifier_group_create, mutation: Mutations::ModifierGroupCreate
    field :item_delete, mutation: Mutations::ItemDelete
    field :item_update, mutation: Mutations::ItemUpdate
    field :item_create, mutation: Mutations::ItemCreate
    field :section_delete, mutation: Mutations::SectionDelete
    field :section_update, mutation: Mutations::SectionUpdate
    field :section_create, mutation: Mutations::SectionCreate
    field :menu_delete, mutation: Mutations::MenuDelete
    field :menu_update, mutation: Mutations::MenuUpdate
    field :menu_create, mutation: Mutations::MenuCreate
  end
end
