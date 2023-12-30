# frozen_string_literal: true

module Mutations
  class MenuSectionUpdate < BaseMutation
    description "Updates a menu_section by id"

    field :menu_section, Types::MenuSectionType, null: false

    argument :id, ID, required: true
    argument :menu_section_input, Types::MenuSectionInputType, required: true

    def resolve(id:, menu_section_input:)
      menu_section = ::MenuSection.find(id)
      raise GraphQL::ExecutionError.new "Error updating menu_section", extensions: menu_section.errors.to_hash unless menu_section.update(**menu_section_input)

      { menu_section: menu_section }
    end
  end
end
