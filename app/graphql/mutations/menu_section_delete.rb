# frozen_string_literal: true

module Mutations
  class MenuSectionDelete < BaseMutation
    description "Deletes a menu_section by ID"

    field :menu_section, Types::MenuSectionType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      menu_section = ::MenuSection.find(id)
      raise GraphQL::ExecutionError.new "Error deleting menu_section", extensions: menu_section.errors.to_hash unless menu_section.destroy!

      { menu_section: menu_section }
    end
  end
end
