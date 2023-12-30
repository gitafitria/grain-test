# frozen_string_literal: true

module Mutations
  class MenuSectionCreate < BaseMutation
    description "Creates a new menu_section"

    field :menu_section, Types::MenuSectionType, null: false

    argument :menu_section_input, Types::MenuSectionInputType, required: true

    def resolve(menu_section_input:)
      menu_section = ::MenuSection.new(**menu_section_input)
      raise GraphQL::ExecutionError.new "Error creating menu_section", extensions: menu_section.errors.to_hash unless menu_section.save

      { menu_section: menu_section }
    end
  end
end
